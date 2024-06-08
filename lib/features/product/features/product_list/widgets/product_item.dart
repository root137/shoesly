import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/svg_network_image.dart';
import 'package:shoesly/features/brand/controller/brand_controller.dart';
import 'package:shoesly/features/brand/model/brand.dart';
import 'package:shoesly/features/product/core/model/product.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

class ProductItem extends ConsumerWidget {
  const ProductItem({required this.product, this.onPressed, super.key});

  final Product product;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Brand? brandByProductId = ref
        .read(brandControllerProvider.notifier)
        .getBrandById(product.brandId);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.red,
        radius: 24,
        borderRadius: BorderRadius.circular(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: COLOR_PRIMARY_100,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (brandByProductId != null)
                    SvgNetworkImage(imageUrl: brandByProductId.imageUrl),
                  const SizedBox(height: 4),
                  if (product.imageUrls.isNotEmpty)
                    Image.network(
                      product.imageUrls.first,
                      height: 85,
                    )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SvgPicture(
                  AssetBytesLoader(
                    a_star,
                  ),
                  width: 12,
                  height: 12,
                  colorFilter: ColorFilter.mode(
                    COLOR_WARNING,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 5),
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
            const SizedBox(height: 5),
            Text(
              '\$${product.price} ',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
