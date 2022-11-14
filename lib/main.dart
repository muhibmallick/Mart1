import 'package:flutter/material.dart';
import 'package:mart1/Controller/Popular_Product_Controller.dart';
import 'package:mart1/Data/Repository/Popular_Product_Repository.dart';
import 'package:mart1/Pages/Food/Popular_Food_detail.dart';
import 'package:mart1/Pages/Home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:mart1/lib/Routes/Routes_helper.dart';
import 'Controller/Recommended_Product_Controller.dart';
import 'Helper/Dependencies.dart' as dep;
import 'Pages/Food/Recommended_Food_Detail.dart';
import 'Pages/Home/food_page_body.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopopularProductController>().getPopularproductList();
    Get.find<RecommendedProductController>().getRecommendedproductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',

      home: MainFooodPage(),
      initialRoute: RouteHelper.Initial,
      getPages: RouteHelper.routes,
      // home: PopularFoodDetail(),
      // home: RecommendedFood(),
      //  home: FoodPageBody(),
    );
  }
}
