import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';
import 'package:shoesly/features/cart/controller/cart_controller.dart';
import 'package:shoesly/features/cart/model/cart.dart';
import 'package:shoesly/features/product/product_detail/widgets/cart_success_bottom_sheet.dart';
import 'package:shoesly/features/product/product_detail/widgets/quantity_selector.dart';
import 'package:uuid/uuid.dart';

class AddToCartBottomSheet extends ConsumerStatefulWidget {
  const AddToCartBottomSheet({
    required this.productName,
    required this.productImageUrl,
    required this.brandName,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
    super.key,
  });
  final String productName;
  final String productImageUrl;
  final String brandName;
  final String productColor;
  final double productSize;
  final double productPrice;

  @override
  ConsumerState<AddToCartBottomSheet> createState() =>
      _AddToCartBottomSheetState();
}

class _AddToCartBottomSheetState extends ConsumerState<AddToCartBottomSheet> {
  int selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
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
              QuantitySelector(
                onQuantityChanged: (quantity) {
                  setState(() {
                    selectedQuantity = quantity;
                  });
                },
              ),
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
                          '\$${widget.productPrice * selectedQuantity}',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ShoeslyElevatedButton(
                      text: s_addToCart,
                      isLoading: ref.watch(cartControllerProvider).isLoading,
                      onPressed: () async {
                        // Add to cart
                        ref
                            .read(cartControllerProvider.notifier)
                            .addToCart(
                              Cart(
                                id: const Uuid().v4(),
                                productName: widget.productName,
                                productImageUrl: widget.productImageUrl,
                                brandName: widget.brandName,
                                productColor: widget.productColor,
                                productSize: widget.productSize,
                                productPrice: widget.productPrice,
                                quantity: selectedQuantity,
                              ),
                            )
                            .then((value) {
                          // Pop the sheet
                          context.pop();
                          _showCartSuccessBottomSheet(context);
                        }).catchError((error) {
                          debugPrint('Error: $error ');
                        });
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
