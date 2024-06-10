import 'package:flutter/material.dart';
import 'package:shoesly/core/themes/app_colors.dart';

class FilterChipWidget extends StatefulWidget {
  const FilterChipWidget({
    super.key,
    this.label,
    this.selectedValue,
  });

  final String? label;

  /// callback returs the selected value
  final Function(String)? selectedValue;

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
            if (selected) {
              widget.selectedValue?.call(widget.label ?? '');
            }
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
            widget.label ?? '',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: selected ? Colors.white : null,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
