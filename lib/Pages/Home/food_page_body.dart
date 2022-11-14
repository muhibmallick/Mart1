import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mart1/Controller/Popular_Product_Controller.dart';
import 'package:mart1/Data/Repository/Popular_Product_Repository.dart';
import 'package:mart1/Pages/Food/Popular_Food_detail.dart';
import 'package:mart1/Pages/Home/AppColumn.dart';
import 'package:mart1/Pages/Home/Utils/App_constants.dart';
import 'package:mart1/Pages/Home/Utils/dimention.dart';
import 'package:mart1/Widgets/BigText.dart';
import 'package:mart1/Widgets/IconAndTextWidget.dart';
import 'package:mart1/Widgets/SmallText.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:mart1/lib/Routes/Routes_helper.dart';
import '../../Controller/Recommended_Product_Controller.dart';
import 'Utils/dimention.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.PageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopopularProductController>(builder: (PopularProducts) {
          return PopularProducts.isLoaded
              ? Container(
                  height: Dimensions.PageView,
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: PopularProducts.Popularproductlist.length,
                        itemBuilder: (context, position) {
                          return _buildpageItem(position,
                              PopularProducts.Popularproductlist[position]);
                        }),
                 
                )
              : CircularProgressIndicator(
                  color: Colors.blue,
                );
        }),
        // Slidler section

        // Dotindicator
        GetBuilder<PopopularProductController>(builder: (PopularProducts) {
          return DotsIndicator(
            dotsCount: PopularProducts.Popularproductlist.isEmpty
                ? 1
                : PopularProducts.Popularproductlist.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              color: Colors.black87, // Inactive color
              activeColor: Colors.redAccent,
            ),
          );
        }),

        SizedBox(
          height: Dimensions.Height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.Width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimensions.Width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: SmallText(
                  text: ".",
                ),
              ),
              SizedBox(
                width: Dimensions.Width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Food Pairing",
                ),
              ),
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProducts.recommendedproductlist.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.Width20,
                          right: Dimensions.Width20,
                          bottom: Dimensions.Height10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: Dimensions.ListViewiImgWidth,
                              width: Dimensions.ListViewiImgWidth,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.Radius15),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(AppConstants.BASE_URL +
                                      AppConstants.UPLOAD_URL +
                                      recommendedProducts
                                          .recommendedproductlist[index].img!),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.ListviewTextcountsize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.Radius20),
                                    bottomRight:
                                        Radius.circular(Dimensions.Radius20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.Width10,
                                      right: Dimensions.Width10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                          text: recommendedProducts
                                              .recommendedproductlist[index]
                                              .name!),
                                      SizedBox(
                                        height: Dimensions.Height10,
                                      ),
                                      SmallText(
                                          text: "With chinese characteristic"),
                                      SizedBox(
                                        height: Dimensions.Height10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            iconcolor: Color.fromARGB(
                                                176, 255, 191, 0),
                                          ),
                                          IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: "1.7Km",
                                            iconcolor: Color.fromARGB(
                                                175, 0, 174, 255),
                                          ),
                                          IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: "32min",
                                            iconcolor:
                                                Color.fromARGB(175, 255, 72, 0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                )
              : CircularProgressIndicator(
                  color: Colors.blue,
                );
        })
      ],
    );
  }

  Widget _buildpageItem(int index, popularproduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currentScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
        transform: matrix,
        child: Stack(
          children: [
            GestureDetector
            (
               onTap: () {
                      Get.toNamed(RouteHelper.getPopularFood(index));
                    },
              child: Container(
                height: Dimensions.PageViewContainer,
                margin: EdgeInsets.only(
                  left: Dimensions.Width10,
                  right: Dimensions.Width10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.Radius30),
                  color: index.isEven ? Colors.blueAccent : Colors.amber,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        popularproduct.img!),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.PageViewTextContainer,
                margin: EdgeInsets.only(
                    left: Dimensions.Width40,
                    right: Dimensions.Width40,
                    bottom: Dimensions.Height40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.Radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 5,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 5,
                      offset: Offset(5, 0),
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      left: 15, right: 15, top: Dimensions.Height10),
                  child: AppColumn(text: popularproduct.name!),
                ),
              ),
            ),
          ],
        ));
  }
}
