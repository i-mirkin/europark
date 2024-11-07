import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

const h1FontSize = 20;
const h1TextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: CupertinoColors.destructiveRed,
);

const double dividerMd = 15;


class Helpers {
  double marginLeft = 30;
  double marginRight = 30;
  double marginTop = 30;
  double divider = 30;

  double fontSize = 16;

  Color? red =  const Color.fromRGBO(255, 255, 91, 255);

  String carKey = 'myCar'; // For SharedPreferences

  var formatter = NumberFormat('#,###');
  String priceFormat (int price) {
    return '${formatter.format(price).replaceAll(',', ' ')} ₽';
  }

  // void addToCart (Product product) async{
  //   var prefs = await SharedPreferences.getInstance();
  //   final cartStr = prefs.getString('cart');
  //   if (cartStr == null) return null;
  //   //
  // }

  bool isLi (BuildContext context) {
    // return MediaQuery.of(context).size.width > 1800;
    return View.of(context).physicalSize.width > 1800;
  }

  double h2(BuildContext context) {
    if(isLi(context)) {
      return 20;
    } else {
      return 14;
    }
  }

  double p(BuildContext context) {
    if(isLi(context)) {
      return 18;
    } else {
      return 12;
    }
  }

}