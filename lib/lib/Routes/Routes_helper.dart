import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mart1/Pages/Food/Popular_Food_detail.dart';
import 'package:mart1/Pages/Home/main_food_page.dart';

import '../../Pages/Food/Recommended_Food_Detail.dart';

class RouteHelper {
  static const String Initial = '/';
  static const String PopularFood = '/Popular-Food';
  static const String recommendedFood = '/recommended-Food';
  static String getInitial() => '$Initial';
  static String getPopularFood(int pageId) => '$PopularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: Initial, page: () => MainFooodPage()),
    GetPage(
        name: PopularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId:int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFood(pageId:int.parse(pageId!));
        },
        transition: Transition.fadeIn),
  ];
}
