import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../utility/helpers.dart';
import '../widgets/my_bottom_navigation_bar.dart';

/// Product Detail Screen
class ProductScreen extends StatelessWidget {
  static const routeName = '/product-screen';

  const ProductScreen({super.key});

  // add to cart press button
  void addToCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Добавить товар в корзину?'),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Нет'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);

                  },
                  child: const Text('Да'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name!),
        elevation: 0,
      ),
      body:

          Helpers().isLi(context)
        ?
              // cart product on Li
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                color: Colors.grey[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    // image
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            product.imgSrc!,
                            width: screenWidth/2 - 50,
                          )
                        ),
                      ],
                    ),

                    // description & price
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Helpers().priceFormat(product.price!),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),

                        Container(
                          width: screenWidth/2 - 50,
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            product.description!,
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        (true)

                            ?

                        Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.grey,
                            shape: BeveledRectangleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add_shopping_cart),
                            color: Theme.of(context).colorScheme.primary,
                            onPressed: () {
                              addToCart(context, product);
                            },
                          ),
                        )

                            :

                        const Text('Уже в корзине')

                      ],
                    )


                  ],
                ),
              )




          :


          Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    product.imgSrc!,
                  )),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Text(
                Helpers().priceFormat(product.price!),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                  product.description!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )),
            const SizedBox(height: 25),
            (true)
                ? Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              alignment: Alignment.bottomLeft,
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Colors.grey,
                  shape: BeveledRectangleBorder(),
                ),
                child:  ElevatedButton(
                  onPressed: () { print('Add To Cart'); },
                  child: Text('Отправить заявку'),
                ),
              ),
            )
                : const Text('Уже в корзине')
          ]),


      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
