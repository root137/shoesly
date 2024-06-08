import 'package:flutter/material.dart';
import 'package:shoesly/core/themes/app_colors.dart';

class FilterChipWidget extends StatefulWidget {
  const FilterChipWidget({super.key});

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
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
          horizontal: 16,
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
        backgroundColor: selected ? COLOR_PRIMARY : Colors.white,
        label: Text(
          'Sort By',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: selected ? Colors.white : null,
              ),
        ),
      ),
    );
  }
}
