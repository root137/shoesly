import 'package:flutter/material.dart';
import 'package:shoesly/core/themes/app_colors.dart';

class SizeWidget extends StatefulWidget {
  const SizeWidget({
    super.key,
    required this.size,
  });

  final double size;

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tapped = !tapped;
        });
      },
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: tapped ? COLOR_PRIMARY : COLOR_PRIMARY_400,
            ),
          ),
          shape: BoxShape.circle,
          color: tapped ? COLOR_PRIMARY : COLOR_WHITE,
        ),
        child: Center(
          child: Text(
            _removeDecimalZero(widget.size),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: tapped ? COLOR_WHITE : COLOR_PRIMARY_400,
                ),
          ),
        ),
      ),
    );
  }

  /// method to remove .0 from size
  String _removeDecimalZero(double size) {
    final String sizeString = size.toString();
    if (sizeString.endsWith('.0')) {
      return sizeString.substring(0, sizeString.length - 2);
    }
    return sizeString;
  }
}
