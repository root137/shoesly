import 'package:flutter/material.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';

class OrderSummaryBottomBar extends StatelessWidget {
  final double totalPrice;
  final double shippingFee;

  const OrderSummaryBottomBar({
    super.key,
    required this.totalPrice,
    required this.shippingFee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: const BoxDecoration(
        color: COLOR_WHITE,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s_grandTotal,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: COLOR_PRIMARY_300,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$${(totalPrice + shippingFee).toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: ShoeslyElevatedButton(
              text: s_payment.toUpperCase(),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
