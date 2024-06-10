import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/features/filter/controller/filter_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceRangeSelector extends ConsumerStatefulWidget {
  const PriceRangeSelector({
    super.key,
    this.onPriceRangeSelected,
  });

  final void Function(double startValue, double endValue)? onPriceRangeSelected;

  @override
  ConsumerState<PriceRangeSelector> createState() => _PriceRangeSelectorState();
}

class _PriceRangeSelectorState extends ConsumerState<PriceRangeSelector> {
  late SfRangeValues _values = SfRangeValues(
      ref.read(filterControllerProvider).minPrice,
      ref.read(filterControllerProvider).maxPrice);

  @override
  Widget build(BuildContext context) {
    const minValue = 0;
    const maxValue = 600;
    final style = Theme.of(context)
        .textTheme
        .headlineSmall
        ?.copyWith(fontWeight: FontWeight.w600);
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: SfRangeSlider(
            min: minValue,
            max: maxValue,
            stepSize: 10,
            values: _values,
            interval: 100,
            enableTooltip: true,
            onChanged: (SfRangeValues values) {
              setState(() {
                _values = values;
                final double startValue = values.start;
                final double endValue = values.end;
                widget.onPriceRangeSelected?.call(startValue, endValue);
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$minValue',
                style: style?.copyWith(color: Colors.grey),
              ),
              Text(
                '\$$maxValue',
                style: style,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
