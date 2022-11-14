import 'package:get/get.dart';
import 'package:mart1/Data/Repository/Popular_Product_Repository.dart';
import 'package:mart1/lib/Data/Repository/Popular_Product_Repository.dart';

import '../Data/Repository/Recommended_Product_Repository.dart';
import '../lib/Models/Products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedproductlist = [];
  List<dynamic> get recommendedproductlist => _recommendedproductlist;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedproductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print('Got products');
      _recommendedproductlist = [];
      _recommendedproductlist.addAll(Product.fromJason(response.body).products);
      // print(_Popularproductlist);
      update();
      _isLoaded = true;
    } else {}
  }
}
