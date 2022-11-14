import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mart1/Pages/Home/Utils/dimention.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  SmallText({
    Key? key,
    this.color,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 0,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size == 0 ? Dimensions.Font12 : size,
        color: color,
      ),
    );
  }
}
