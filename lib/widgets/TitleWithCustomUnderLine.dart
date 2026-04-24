import 'package:flutter/material.dart';

import '../AppColors.dart';
import '../utils/SizeConfig.dart';

class TitleWithCustomUnderLine extends StatelessWidget {
  const TitleWithCustomUnderLine({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.68 * SizeConfig.heightMultiplier,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 3.86 * SizeConfig.widthMultiplier / 4,
            ),
            child: Text(
              text,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(
                right: 3.86 * SizeConfig.widthMultiplier / 4,
              ),
              height: 0.90 * SizeConfig.widthMultiplier,
              color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.darkPrimaryVariant
                                          .withOpacity(0.50)
                                      : AppColors.lightPrimaryVariant
                                          .withOpacity(0.50),
                  
            ),
          ),
        ],
      ),
    );
  }
}
