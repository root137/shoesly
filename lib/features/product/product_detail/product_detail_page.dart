import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/router/routes.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_appbar.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';
import 'package:shoesly/features/brand/controller/brand_controller.dart';
import 'package:shoesly/features/product/core/model/product.dart';
import 'package:shoesly/features/product/product_detail/widgets/add_to_cart_bottom_sheet.dart';
import 'package:shoesly/features/product/product_detail/widgets/product_image_slider.dart';
import 'package:shoesly/features/product/product_detail/widgets/size_widget.dart';

class ProductDetailPage extends ConsumerWidget {
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: ShoeslyAppbar(
        backgroundColor: COLOR_PRIMARY_100.withOpacity(0.4),
        actions: ShoeslyIconButton(
          assetImagePath: a_cart,
          onPressed: () {
            context.pushNamed(
              Routes.cartPage.name,
            );
          },
        ),
      ),
      body: ColoredBox(
        color: COLOR_PRIMARY_100.withOpacity(0.4),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 315,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: COLOR_PRIMARY_200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ProductImageSlider(
                  imageUrls: product.imageUrls,
                  colors: product.colors,
                  productId: product.id,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                product.name,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 5),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  RatingBarIndicator(
                    unratedColor: COLOR_PRIMARY_200,
                    itemBuilder: (context, index) {
                      return const Icon(
                        Icons.star_rounded,
                        color: COLOR_WARNING,
                      );
                    },
                    itemSize: 20,
                    rating: product.averageRating.toDouble(),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    product.averageRating.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '(${product.reviewCount} Reviews)',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: COLOR_PRIMARY_400),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                s_size,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...product.sizes.map(
                      (size) {
                        return SizeWidget(
                          size: size,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                s_description,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                product.description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: COLOR_PRIMARY_400,
                    ),
              ),
              const SizedBox(height: 30),
              Text(
                '$s_review (10)',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
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
                    s_price,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: COLOR_PRIMARY_300,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$${product.price}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ShoeslyElevatedButton(
                text: s_addToCart,
                onPressed: () {
                  _showAddToCartBottomSheet(context, ref);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showAddToCartBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return AddToCartBottomSheet(
          productName: product.name,
          // TODO: Provide selected image url, size and color
          productImageUrl: product.imageUrls.first,
          productSize: product.sizes.first,
          productColor: product.colors.first,
          productPrice: product.price,
          brandName: ref
                  .read(brandControllerProvider.notifier)
                  .getBrandById(product.brandId)
                  ?.name ??
              '-',
        );
      },
    );
  }
}
