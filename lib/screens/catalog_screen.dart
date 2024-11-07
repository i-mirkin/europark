import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/category.dart';
import '../models/product.dart';
import '../server_handler.dart';
import '../utility/helpers.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_bottom_navigation_bar.dart';
import '../widgets/my_drawer.dart';
import '../widgets/product_item.dart';


class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});
  static const routeName = '/catalog-screen';

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {

  List<Category> _categories = [];
  List<List<Product>> _products = List.generate(100, (i) => [], growable: true);
  String? _myPhone;
  bool _firstExec = true; // 4 single exec control


  Future<void> _getMyPhone() async {
    final prefs = await SharedPreferences.getInstance();
    String? myPhone = prefs.getString('phone') ?? '';
    setState(() => _myPhone = myPhone);
  }

  void getCategories([String? myPhone = '']) async {
    var categories = await ServerHandler().getCategories(_myPhone);
    setState(() {
      _categories = categories;
    });
  }

  void getCategoriesWithProducts([String? myPhone = '']) async {
    // await _getMyCar();
    var productsByCategory = await ServerHandler().getCategoriesWithProducts(_myPhone);
    setState(() {
      _products = productsByCategory;
    });
  }



  @override
  Widget build(BuildContext context) {

    if (_firstExec) {
      _getMyPhone();
      getCategories(_myPhone);
      getCategoriesWithProducts(_myPhone);

      _firstExec = false;
    }
    int crossAxisCount = 2;

    return Scaffold(
      appBar: MyAppBar(appBar: AppBar(), title: 'Каталог'),
      drawer: const MyDrawer(),
      body: DefaultTabController(
        length: _categories.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabs: _categories
                  .map((e) => Tab(
                child: Text(
                  //'${e.name} sect=${e.sectionId} carid=${_myCar?.id ?? 0}',
                  '${e.name}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ))
                  .toList(),
            ),
            title: Text(
              // context.watch<Shop>().myCar.name!,
              _myPhone.toString(),
              style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: TabBarView(
              children:
              _products.take(_categories.length)
                  .map((productsPerCategory)  {return Container(
                margin: const EdgeInsets.only(top: 40),
                child: GridView.builder(
                  itemCount: productsPerCategory.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) =>
                      ProductItem(product: productsPerCategory[index], productIndex: index),
                ),
              );}
              )
                  .toList(),
            ),
          ),
        ),
      ),

      bottomNavigationBar: const MyBottomNavigationBar(),

    );
  }
}
