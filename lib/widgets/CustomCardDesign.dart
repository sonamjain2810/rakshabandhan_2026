// File: widgets/custom_card_design.dart
import 'package:flutter/material.dart';
import '../AppColors.dart';
import '../utils/SizeConfig.dart';

class CustomCardDesign extends StatelessWidget {
  const CustomCardDesign({
    Key? key,
    required this.size,
    this.image,
    this.title,
    this.ontap,
  }) : super(key: key);

  final Size size;
  final String? image;
  final String? title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(
          left: 3.86 * SizeConfig.widthMultiplier,
          right: 3.86 * SizeConfig.widthMultiplier / 2,
          bottom: 3.86 * SizeConfig.widthMultiplier * 2.5,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        width: size.width * 0.5,
        child: Column(
          children: <Widget>[
            Image.asset(
              image ?? '',
              height: 20 * SizeConfig.heightMultiplier,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(3.86 * SizeConfig.widthMultiplier),
              decoration: BoxDecoration(
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? AppColors.darkPrimaryVariant
                        : AppColors.lightPrimaryVariant,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 12 * SizeConfig.widthMultiplier,
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkPrimaryVariant.withOpacity(0.50)
                            : AppColors.lightPrimaryVariant.withOpacity(0.50),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RichText(
                      maxLines: 1,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: title?.toUpperCase() ?? '',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
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
