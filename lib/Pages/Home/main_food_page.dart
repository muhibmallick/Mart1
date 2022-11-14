import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mart1/Pages/Home/Utils/dimention.dart';
import 'package:mart1/Widgets/BigText.dart';
import 'package:mart1/Widgets/SmallText.dart';
import 'food_page_body.dart';

class MainFooodPage extends StatefulWidget {
  const MainFooodPage({super.key});

  @override
  State<MainFooodPage> createState() => _MainFooodPageState();
}

class _MainFooodPageState extends State<MainFooodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is " + MediaQuery.of(context).size.height.toString());
    print("current Width is " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.Height50),
              padding: EdgeInsets.only(
                  left: Dimensions.Width10, right: Dimensions.Width10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Pakistan"),
                      Row(
                        children: [
                          SmallText(text: "Karachi"),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimensions.Iconsize24,
                    ),
                    width: Dimensions.Width45,
                    height: Dimensions.Height45,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.Radius15),
                        color: Colors.lightGreenAccent),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          )
        ],
      ),
    );
  }
}
