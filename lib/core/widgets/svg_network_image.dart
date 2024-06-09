import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/core/themes/app_colors.dart';

class SvgNetworkImage extends StatelessWidget {
  const SvgNetworkImage(
      {required this.imageUrl, this.size = 24, this.imageColor, super.key});

  final String imageUrl;
  final double size;
  final Color? imageColor;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(imageUrl,
        width: size,
        height: size,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(
          imageColor ?? COLOR_PRIMARY_300,
          BlendMode.srcIn,
        ));
  }
}
