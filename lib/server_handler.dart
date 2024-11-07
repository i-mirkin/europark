import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/category.dart';
import 'models/product.dart';
import 'models/user.dart';

class ServerHandler {
  final String _baseUrl = 'https://europark-tech.ru/local/api/';

  Future<List<User>> getUsers([String phone = '']) async {
    try{
      List<User> users = [];
      var response = await http.get(Uri.parse('$_baseUrl?action=users&name=$phone'));
      print(response.body);
      dynamic userList = json.decode(response.body);
      for(Map m in userList){
        users.add(User.fromMap(m));
      }
      return users;
    }
    catch(e) {
      print('Server Handler error in getUsers: $e');
      rethrow;
    }
  }


  // список категорий
  Future<List<Category>> getCategories([String? phone = '']) async {
    try{
      List<Category> categories = [];
      var response = await http.get(Uri.parse('$_baseUrl?action=categories&phone=$phone'));
      dynamic categoriesList = json.decode(response.body);
      for(Map m in categoriesList){
        categories.add(Category.fromMap(m));
      }
      return categories;
    }
    catch(e) {
      print('Server Handler error in getProductsPerCar: $e');
      rethrow;
    }
  }

  Future<List<List<Product>>> getCategoriesWithProducts([String? phone = '']) async {
    try{
      List<List<Product>> products = List.generate(100, (i) => [], growable: true);
      var response = await http.get(Uri.parse('$_baseUrl?action=categories_with_products&phone=$phone'));
      print('getCategoriesWithProducts: ' + response.body);
      dynamic productsList = json.decode(response.body);
      int i = 0;
      productsList.forEach((category){
        for(Map m in category){
          products[i].add(Product.fromMap(m));
        }
        i++;
      });

      return products;
    }
    catch(e) {
      print('Server Handler error in getCategoriesWithProducts: $e');
      rethrow;
    }
  }



}