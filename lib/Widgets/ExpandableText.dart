import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mart1/Pages/Home/Utils/dimention.dart';
import 'package:mart1/Widgets/SmallText.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String FirstHalf;
  late String SecondHalf;

  bool HiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      FirstHalf = widget.text.substring(0, textHeight.toInt());
      SecondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      FirstHalf = widget.text;
      SecondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SecondHalf.isEmpty
          ? SmallText(size: Dimensions.Font16, text: FirstHalf)
          : Column(
              children: [
                SmallText(
                  height: 1.8,
                  color: Colors.black,
                  size: Dimensions.Font16,
                  text: HiddenText
                      ? (FirstHalf + "...")
                      : (FirstHalf + SecondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      HiddenText = !HiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show more",
                        color: Colors.green,
                      ),
                      Icon(
                        (HiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up),
                        color: Colors.green,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
