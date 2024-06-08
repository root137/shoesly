// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _quantity = 1;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = _quantity.toString();
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      _controller.text = _quantity.toString();
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        _controller.text = _quantity.toString();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s_quantity,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 40,
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _quantity = int.tryParse(value) ?? 1;
                    if (_quantity < 1) _quantity = 1;
                    _controller.text = _quantity.toString();
                  });
                },
              ),
            ),
            const Spacer(),
            ShoeslyIconButton(
              assetImagePath: a_minus_circle,
              onPressed: _decrementQuantity,
              iconColor: COLOR_PRIMARY_300,
            ),
            const SizedBox(
              width: 10,
            ),
            ShoeslyIconButton(
              assetImagePath: a_add_circle,
              onPressed: _incrementQuantity,
            ),
          ],
        ),
        const Divider(
          thickness: 1,
          color: COLOR_PRIMARY,
        ),
      ],
    );
  }
}
