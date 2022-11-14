import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mart1/Controller/Popular_Product_Controller.dart';
import 'package:mart1/Pages/Home/AppColumn.dart';
import 'package:mart1/Pages/Home/Utils/App_constants.dart';
import 'package:mart1/Pages/Home/Utils/dimention.dart';
import 'package:mart1/Pages/Home/food_page_body.dart';
import 'package:mart1/Pages/Home/main_food_page.dart';
import 'package:mart1/Widgets/ExpandableText.dart';
import 'package:mart1/Widgets/FoodDetailAppIcons.dart';
import 'package:get/get.dart';
import '../../Widgets/BigText.dart';
import '../../Widgets/SmallText.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopopularProductController>().Popularproductlist[pageId];
    // print('page id is ' + pageId.toString());
    // print('Product name is ' + product.name.toString());
    Get.find<PopopularProductController>().initProduct();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // background image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                height: Dimensions.PopularImageSize,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.BASE_URL +
                          AppConstants.UPLOAD_URL +
                          product.img!)),
                ),
              ),
            ),
            // Icon Widget
            Positioned(
              top: Dimensions.Height45,
              left: Dimensions.Width20,
              right: Dimensions.Width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(() => MainFooodPage());
                      },
                      child: FoodDetailAppIcon(icon: Icons.arrow_back_ios)),
                  FoodDetailAppIcon(icon: Icons.shopping_cart),
                ],
              ),
            ),
            //  Intriduction to food
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.PopularImageSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.Width20,
                    right: Dimensions.Width20,
                    top: Dimensions.Height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.Radius20),
                    topLeft: Radius.circular(Dimensions.Radius20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: product.name!,
                    ),
                    SizedBox(
                      height: Dimensions.Height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.Height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableText(text: product.description!)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopopularProductController>(builder: (PopularProducts) {
          return Container(
            height: Dimensions.BottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.Height30,
                bottom: Dimensions.Height30,
                left: Dimensions.Width20,
                right: Dimensions.Width20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 239, 239),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.Radius20 * 2),
                topRight: Radius.circular(Dimensions.Radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.Height20,
                      bottom: Dimensions.Height20,
                      right: Dimensions.Width20,
                      left: Dimensions.Width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.Radius20),
                    color: Color.fromARGB(197, 255, 255, 255),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (() {
                          PopularProducts.SetQuantity(false);
                        }),
                        child: Icon(
                          Icons.remove,
                          color: Color.fromARGB(236, 128, 122, 122),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.Width10 / 2,
                      ),
                      BigText(text: PopularProducts.quantity.toString()),
                      SizedBox(
                        width: Dimensions.Width10 / 2,
                      ),
                      GestureDetector(
                        onTap: (() {
                          PopularProducts.SetQuantity(true);
                        }),
                        child: Icon(
                          Icons.add,
                          color: Color.fromARGB(236, 128, 122, 122),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.Height20,
                      bottom: Dimensions.Height20,
                      right: Dimensions.Width20,
                      left: Dimensions.Width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.Radius20),
                    color: Color.fromARGB(255, 163, 231, 99),
                  ),
                  child: BigText(
                    text: "\$ ${product.price!} | Add to Cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
