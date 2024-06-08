import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_appbar.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';
import 'package:shoesly/features/cart/widget/cart_item_widget.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const ShoeslyAppbar(
        title: s_cart,
        centreTitle: true,
      ),
      body: Expanded(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: COLOR_PRIMARY_100.withOpacity(0.4),
          child: const SingleChildScrollView(
            child: CartItemWidget(),
          ),
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
                text: s_checkOut,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
