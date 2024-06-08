import 'package:flutter/material.dart';
import 'package:shoesly/core/themes/app_colors.dart';

class ShoeslyElevatedButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final bool? isLoading;
  final Widget? icon;

  const ShoeslyElevatedButton({
    super.key,
    required this.text,
    this.backgroundColor = COLOR_PRIMARY,
    this.foregroundColor = COLOR_WHITE,
    required this.onPressed,
    this.height = 50,
    this.width = double.infinity,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: (!isLoading!)
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) icon!,
                  Text(
                    text.toUpperCase(),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: foregroundColor ?? COLOR_WHITE,
                        ),
                  ),
                ],
              )
            : SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    foregroundColor ?? COLOR_WHITE,
                  ),
                ),
              ),
      ),
    );
  }
}
