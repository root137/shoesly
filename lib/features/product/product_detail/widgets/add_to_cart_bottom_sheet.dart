import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';
import 'package:shoesly/features/product/product_detail/widgets/cart_success_bottom_sheet.dart';
import 'package:shoesly/features/product/product_detail/widgets/quantity_selector.dart';

class AddToCartBottomSheet extends ConsumerWidget {
  const AddToCartBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.all(30).copyWith(
            bottom: MediaQuery.of(context).viewInsets.bottom + 30,
          ),
          decoration: const BoxDecoration(
            color: COLOR_WHITE,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    s_addToCart,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ShoeslyIconButton(
                    assetImagePath: a_close,
                    size: 20,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const QuantitySelector(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          s_price,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: COLOR_PRIMARY_300,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '\$100',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ShoeslyElevatedButton(
                      text: s_addToCart,
                      onPressed: () {
                        context.pop();
                        _showCartSuccessBottomSheet(context);
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

  void _showCartSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return const CartSuccessBottomSheet();
      },
    );
  }
}
