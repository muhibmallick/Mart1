import 'package:get/get.dart';
import 'package:mart1/lib/Models/Products_model.dart';

import '../Data/Repository/CartRepository.dart';
import '../lib/Models/Cart_Model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
    _items.putIfAbsent(key, () => null)
  }
}
