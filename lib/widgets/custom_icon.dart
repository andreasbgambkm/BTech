import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String iconPath;

  final double width;
  final double height;

  const CustomIcon({
    required this.iconPath,

    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconPath,
      width: width,
      height: height,
    );
  }
}
