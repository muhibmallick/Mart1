import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mart1/Pages/Home/Utils/dimention.dart';
import 'package:mart1/Widgets/BigText.dart';
import 'package:mart1/Widgets/ExpandableText.dart';
import 'package:mart1/Widgets/FoodDetailAppIcons.dart';
import 'package:get/get.dart';

import '../../Controller/Recommended_Product_Controller.dart';
import '../../lib/Routes/Routes_helper.dart';
import '../Home/Utils/App_coNstants.dart';

class RecommendedFood extends StatelessWidget {
  final int pageId;
  const RecommendedFood({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
     var product =
        Get.find<RecommendedProductController>().recommendedproductlist[pageId];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.Height40 * 2,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: FoodDetailAppIcon(icon: Icons.clear),
                ),
                FoodDetailAppIcon(icon: Icons.shopping_cart_checkout_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.Height20),
              child: Container(
                width: double.maxFinite,
                child: Center(
                  child: BigText(
                    size: Dimensions.Font26,
                    text: product.name!,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.Radius15),
                    topRight: Radius.circular(Dimensions.Radius15),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.redAccent,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.Width10, right: Dimensions.Width10),
                  child: ExpandableText(
                      text:
                          product.description!))
            ],
          )),
        ],
      ),
      bottomNavigationBar: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  right: Dimensions.Width20 * 2.5,
                  left: Dimensions.Width20 * 2.5,
                  top: Dimensions.Height10,
                  bottom: Dimensions.Height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FoodDetailAppIcon(
                      iconsize: Dimensions.Iconsize24,
                      iconcolor: Colors.black,
                      backgroundcolor: Color.fromARGB(255, 163, 231, 99),
                      icon: Icons.remove),
                  BigText(text: "\$${product.price!} X  0"),
                  FoodDetailAppIcon(
                      iconsize: Dimensions.Iconsize24,
                      iconcolor: Colors.black,
                      backgroundcolor: Color.fromARGB(255, 163, 231, 99),
                      icon: Icons.add),
                ],
              ),
            ),
            Container(
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
                        Icon(
                          Icons.favorite,
                          color: Color.fromARGB(255, 163, 231, 99),
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
                      text: "\$10 | Add to Cart",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
