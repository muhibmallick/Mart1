import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mart1/Widgets/IconAndTextWidget.dart';

import '../../Widgets/BigText.dart';
import '../../Widgets/SmallText.dart';
import 'Utils/dimention.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.Font26,
        ),
        SizedBox(
          height: Dimensions.Height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(Icons.star, color: Colors.blueAccent, size: 10),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: 10,
            ),
            SmallText(text: "1278"),
            SizedBox(
              width: 7,
            ),
            SmallText(text: "Comment"),
          ],
        ),
        SizedBox(
          height: Dimensions.Height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.location_on,
              text: '1.7 Km',
              iconcolor: Colors.blue,
            ),
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconcolor: Color.fromARGB(255, 243, 170, 33)),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '32 min',
                iconcolor: Color.fromARGB(255, 243, 65, 33)),
          ],
        ),
      ],
    );
  }
}
