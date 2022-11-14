import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // total height of screen which is 320 of both container body size
  // 820 devided by 320 = 2.5625
  static double PageView = screenHeight / 2.5625;
  // static double PageView2 = screenWidth / 4.26875;

// to get the height use media query to get full height of the mobile screen
//then , which is 820 devided by provided height which is 220 after deving we get
// == 3.72727273
  static double PageViewContainer = screenHeight / 3.72727273;
  // same way we use the height of mobile screen which is 820 then we devide it
  // the second container height which overlying showing text of dishes its height is 120
  //after deviding we get == 6.83333333
  static double PageViewTextContainer = screenHeight / 6.83333333;
  //820 devided by 10= 82
  static double Height10 = screenHeight / 82;
  //820 devided by 20= 41
  static double Height15 = screenHeight / 54.6666667;
  static double Height20 = screenHeight / 41;
  static double Height30 = screenHeight / 27.3333333;
  static double Height40 = screenHeight / 20.5;
  static double Height45 = screenHeight / 18.2222222;
  static double Height50 = screenHeight / 16.4;

  // Dynamic fonts

  static double Font12 = screenHeight / 68.3333333;
  static double Font16 = screenHeight / 51.52;
  static double Font20 = screenHeight / 41;
  static double Font26 = screenHeight / 31.5384615385;
  // Dynamic Radius
  static double Radius20 = screenHeight / 41;
  static double Radius30 = screenHeight / 27.3333333;
  static double Radius15 = screenHeight / 54.6666667;

  //Dynamic widh
  static double Width10 = screenHeight / 82;
  static double Width15 = screenHeight / 54.6666667;
  static double Width20 = screenHeight / 41;
  static double Width30 = screenHeight / 27.3333333;
  static double Width40 = screenHeight / 20.5;
  static double Width45 = screenHeight / 18.2222222;
  // Icon size
  static double Iconsize24 = screenHeight / 34.1666667;
  static double Iconsize16 = screenHeight / 51.25;

// Listview image size Height
  static double ListViewiImgWidth = screenWidth / 3.425;

  static double ListviewTextcountsize = screenWidth / 4.11;

  static double PopularImageSize = screenHeight / 2.34285714;
// bottom height bar
  static double BottomHeightBar = screenHeight / 6.83333333;
}
