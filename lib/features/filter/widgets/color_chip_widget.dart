import 'package:flutter/material.dart';
import 'package:shoesly/core/themes/app_colors.dart';

class ColorChipWidget extends StatefulWidget {
  const ColorChipWidget({super.key});

  @override
  State<ColorChipWidget> createState() => _ColorChipWidgetState();
}

class _ColorChipWidgetState extends State<ColorChipWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Chip(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        side: BorderSide(
          color: selected ? COLOR_PRIMARY : COLOR_PRIMARY_200,
          width: 1,
        ),
        backgroundColor: Colors.white,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    color: COLOR_PRIMARY_100,
                    width: 1,
                  ),
                ),
                color: COLOR_WHITE,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Sort By',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
