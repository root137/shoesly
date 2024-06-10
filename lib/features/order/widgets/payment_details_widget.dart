import 'package:flutter/material.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget({super.key, this.totalPrice, this.shippingFee});

  final double? totalPrice;
  final double? shippingFee;

  @override
  Widget build(BuildContext context) {
    final grandTotal = totalPrice! + shippingFee!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s_paymentDetail,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s_subTotal,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: COLOR_DARK_GREY,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              '\$${totalPrice!.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s_shipping,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: COLOR_DARK_GREY,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              '\$${shippingFee!.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s_totalOrder,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: COLOR_DARK_GREY,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              '\$${grandTotal.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ],
    );
  }
}
