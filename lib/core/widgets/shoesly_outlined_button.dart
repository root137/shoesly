import 'package:flutter/material.dart';
import 'package:shoesly/core/themes/app_colors.dart';

class ShoeslyOutlinedButton extends StatelessWidget {
  final String text;
  final Color? borderColor;
  final Color? foregroundColor;
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final bool? isLoading;

  const ShoeslyOutlinedButton({
    super.key,
    required this.text,
    this.borderColor = COLOR_PRIMARY,
    this.foregroundColor = COLOR_PRIMARY,
    required this.onPressed,
    this.height = 50,
    this.width = double.infinity,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        child: (!isLoading!)
            ? Text(
                text.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: foregroundColor ?? COLOR_PRIMARY,
                    ),
              )
            : SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    foregroundColor ?? COLOR_PRIMARY,
                  ),
                ),
              ),
      ),
    );
  }
}
