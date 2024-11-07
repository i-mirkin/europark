import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_screen.dart';
import '../utility/helpers.dart';

/// Product in Category
class ProductItem extends StatelessWidget {
  final Product product;
  final int productIndex;

  const ProductItem({super.key, required this.product, required this.productIndex});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    // double height = MediaQuery.sizeOf(context).height;

    double cardWidth = width * 0.4;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(ProductScreen.routeName, arguments: product),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: (product.imgSrc.toString() != '') 
                        ? Image.network(
                            product.imgSrc!,
                            width: cardWidth,
                          )
                        : Image.asset('assets/imgs/nophoto.jpg')
                ),

                
              ],
            ),

            Container(
              margin: const EdgeInsets.only(top: 10),
              width: cardWidth,
              child: Text(
                product.name!,
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: Helpers().h2(context),
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            // PRICE
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: cardWidth,
              child: Text(
                Helpers().priceFormat(product.price!),
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
