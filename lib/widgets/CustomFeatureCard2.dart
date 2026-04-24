import 'package:flutter/material.dart';
import '../utils/SizeConfig.dart';

class CustomFeatureCard2 extends StatelessWidget {
  const CustomFeatureCard2({
    Key? key,
    required this.size,
    required this.imageUrl,
    required this.ontap,
  }) : super(key: key);

  final Size size;
  final String imageUrl;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(
          left: 3.86 * SizeConfig.widthMultiplier,
          top: 3.86 * SizeConfig.widthMultiplier / 2,
          bottom: 3.86 * SizeConfig.widthMultiplier / 2,
        ),
        width: size.width * 0.8,
        height: 40 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}