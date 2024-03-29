import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mart1/Pages/Home/Utils/dimention.dart';

class FoodDetailAppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundcolor;
  final Color iconcolor;
  final double size;
  final double iconsize;
  const FoodDetailAppIcon({
    Key? key,
    required this.icon,
    this.backgroundcolor = Colors.white70,
    this.size = 40,
    this.iconsize = 16,
    this.iconcolor = Colors.black,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundcolor,
      ),
      child: Icon(
        icon,
        color: iconcolor,
        size: iconsize,
      ),
    );
  }
}
