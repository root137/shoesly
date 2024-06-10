import 'package:flutter/material.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';

class PaymentInformationWidget extends StatelessWidget {
  const PaymentInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s_information,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s_paymentMethod,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 5),
                Text(
                  'Credit Card',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: COLOR_DARK_GREY,
                      ),
                ),
              ],
            ),
            const ShoeslyIconButton(
              iconColor: COLOR_PRIMARY_300,
              size: 16,
              assetImagePath: a_arrow_right,
            )
          ],
        ),
        const SizedBox(height: 20),
        const Divider(thickness: 1),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s_location,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 5),
                Text(
                  'Semarang, Indonesia',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: COLOR_DARK_GREY,
                      ),
                ),
              ],
            ),
            const ShoeslyIconButton(
              iconColor: COLOR_PRIMARY_300,
              size: 16,
              assetImagePath: a_arrow_right,
            )
          ],
        ),
      ],
    );
  }
}
