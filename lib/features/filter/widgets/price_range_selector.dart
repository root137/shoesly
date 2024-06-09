import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceRangeSelector extends StatefulWidget {
  const PriceRangeSelector({
    super.key,
    this.onPriceRangeSelected,
  });

  final void Function(double startValue, double endValue)? onPriceRangeSelected;

  @override
  State<PriceRangeSelector> createState() => _PriceRangeSelectorState();
}

class _PriceRangeSelectorState extends State<PriceRangeSelector> {
  SfRangeValues _values = const SfRangeValues(50.0, 300.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: SfRangeSlider(
            min: 0,
            max: 600,
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
      ],
    );
  }
}
