import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/router/routes.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';
import 'package:shoesly/core/widgets/shoesly_outlined_button.dart';
import 'package:shoesly/features/cart/controller/cart_controller.dart';

class CartSuccessBottomSheet extends ConsumerWidget {
  const CartSuccessBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const height20 = SizedBox(height: 20);
    int itemCount = 0;
    ref
        .watch(cartControllerProvider)
        .whenData((value) => itemCount = value.cartItems.length);
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.all(
            30,
          ),
          decoration: const BoxDecoration(
            color: COLOR_WHITE,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ShoeslyIconButton(
                assetImagePath: a_tick_circle,
                size: 100,
              ),
              height20,
              Text(
                s_addedToCart,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$itemCount $s_itemTotal",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: COLOR_PRIMARY_400,
                    ),
              ),
              height20,
              Row(
                children: [
                  Expanded(
                    child: ShoeslyOutlinedButton(
                      text: s_backExplore.toUpperCase(),
                      onPressed: () {
                        // Pop the sheet
                        context.pop();
                        // Navigate to dashboard page
                        context.pop();
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ShoeslyElevatedButton(
                      text: s_toCart.toUpperCase(),
                      onPressed: () {
                        // Close the sheet
                        context.pop();
                        context.pushNamed(Routes.cartPage.name);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
