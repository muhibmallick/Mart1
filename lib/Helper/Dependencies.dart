import 'package:mart1/Controller/Cart_Controller.dart';
import 'package:mart1/Controller/Popular_Product_Controller.dart';
import 'package:mart1/Data/Api/Api_client.dart';
import 'package:get/get.dart';
import 'package:mart1/Data/Repository/CartRepository.dart';
import 'package:mart1/Data/Repository/Popular_Product_Repository.dart';
import 'package:mart1/Pages/Home/Utils/App_coNstants.dart';

import '../Controller/Recommended_Product_Controller.dart';
import '../Data/Repository/Recommended_Product_Repository.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
//repos
  Get.lazyPut((() => PopularProductRepo(apiClient: Get.find())));
  Get.lazyPut((() => RecommendedProductRepo(apiClient: Get.find())));
  Get.lazyPut(() => CartRepo());
//Controllers
  Get.lazyPut(
      (() => PopopularProductController(popularProductRepo: Get.find())));
  Get.lazyPut(
      (() => RecommendedProductController(recommendedProductRepo: Get.find())));
      Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
