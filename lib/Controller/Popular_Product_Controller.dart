import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mart1/Data/Repository/Popular_Product_Repository.dart';
import 'package:mart1/lib/Data/Repository/Popular_Product_Repository.dart';

import '../lib/Models/Products_model.dart';

class PopopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopopularProductController({required this.popularProductRepo});

  List<dynamic> _Popularproductlist = [];
  List<dynamic> get Popularproductlist => _Popularproductlist;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _InCartItems = 0;
  int get InCartItems => _InCartItems + _quantity;

  Future<void> getPopularproductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print('Got products');
      _Popularproductlist = [];
      _Popularproductlist.addAll(Product.fromJason(response.body).products);
      // print(_Popularproductlist);
      update();
      _isLoaded = true;
    } else {}
  }

  void SetQuantity(bool isIncrement) {
    if (isIncrement) {
      // print("increment" + _quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
      // print("decrement" + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        "Item Count",
        "You can't reduce more !",
        backgroundColor: Color.fromARGB(255, 74, 75, 75),
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(
        "Item Count",
        "You can't add more !",
        backgroundColor: Color.fromARGB(255, 74, 75, 75),
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct() {
    _quantity = 0;
    _InCartItems = 0;
    //Get from storage _InCartItems
  }
}
