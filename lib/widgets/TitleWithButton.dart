import 'package:flutter/material.dart';

import '../utils/SizeConfig.dart';
import 'TitleWithCustomUnderLine.dart';

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 3.86 * SizeConfig.widthMultiplier,
      ),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderLine(text: title),
          const Spacer(),
          ElevatedButton(
            onPressed: press,
            child: const Text("More"),
          ),
        ],
      ),
    );
  }
}
