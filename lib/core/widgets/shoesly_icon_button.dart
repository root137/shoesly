import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/dot_indicator.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

class ShoeslyIconButton extends StatelessWidget {
  const ShoeslyIconButton({
    super.key,
    required this.assetImagePath,
    this.size = 24,
    this.iconColor,
    this.onPressed,
    this.fit = BoxFit.contain,
    this.hasNotifiable = false,
  });

  final String assetImagePath;
  final double? size;
  final Color? iconColor;
  final BoxFit? fit;
  final VoidCallback? onPressed;
  final bool hasNotifiable;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Stack(
        children: [
          SvgPicture(
            AssetBytesLoader(
              assetImagePath,
            ),
            width: size,
            height: size,
            colorFilter: ColorFilter.mode(
              iconColor ?? COLOR_PRIMARY,
              BlendMode.srcIn,
            ),
            fit: fit ?? BoxFit.contain,
          ),
          if (hasNotifiable)
            const Positioned(
              right: 0,
              top: 0,
              child: DotIndicator(),
            )
        ],
      ),
    );
  }
}
