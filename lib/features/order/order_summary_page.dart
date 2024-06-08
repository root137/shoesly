import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_appbar.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';

class OrderSummaryPage extends ConsumerWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const ShoeslyAppbar(
        title: s_orderSummary,
        centreTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: COLOR_PRIMARY_100.withOpacity(0.4),
        child: const SingleChildScrollView(
          child: OrderSummaryDetail(),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
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
                    '\$300',
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
            )
          ],
        ),
      ),
    );
  }
}

class OrderSummaryDetail extends ConsumerWidget {
  const OrderSummaryDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const height20 = SizedBox(height: 20);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s_information,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              height20,
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
                      const SizedBox(
                        height: 5,
                      ),
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
              height20,
              const Divider(
                thickness: 1,
              ),
              height20,
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
                      const SizedBox(
                        height: 5,
                      ),
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
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s_orderDetails,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              height20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    s_paymentMethod,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Credit Card',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: COLOR_DARK_GREY,
                            ),
                      ),
                      Text(
                        '\$150,00',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s_paymentDetail,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    s_subTotal,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: COLOR_DARK_GREY,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$150,00',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    s_shipping,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: COLOR_DARK_GREY,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$150,00',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              height20,
              const Divider(
                thickness: 1,
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    s_totalOrder,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: COLOR_DARK_GREY,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$300,00',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
