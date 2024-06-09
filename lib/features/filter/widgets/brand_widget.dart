import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';
import 'package:shoesly/core/widgets/svg_network_image.dart';
import 'package:shoesly/features/brand/controller/brand_controller.dart';
import 'package:shoesly/features/brand/controller/brand_state.dart';
import 'package:shoesly/features/brand/model/brand.dart';
import 'package:shoesly/features/product/features/product_list/controller/product_list_controller.dart';

class BrandWidget extends ConsumerStatefulWidget {
  const BrandWidget({this.onBrandSelected, super.key});
  final ValueSetter<String>? onBrandSelected;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BrandWidgetState();
}

class _BrandWidgetState extends ConsumerState<BrandWidget> {
  @override
  Widget build(BuildContext context) {
    final brandsAsync = ref.watch(brandControllerProvider);
    return brandsAsync.when(
      data: (brandState) {
        return _buildBrandsList(brandState);
      },
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      error: (error, stack) => Center(
        child: Text('Error: $error'),
      ),
    );
  }

  Widget _buildBrandsList(BrandState brandState) {
    final List<Brand> allBrands = List.from(brandState.allBrands);
    final List<Brand> filteredBrands = allBrands
      ..removeWhere((element) => element.id == '');
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          bool selected =
              filteredBrands[index].id == brandState.selectedBrandId;
          return _brandListItem(
            brand: filteredBrands[index],
            selected: selected,
            onTap: () {
              ref
                  .read(brandControllerProvider.notifier)
                  .updateBrandIndexByBrandId(filteredBrands[index].id);
              widget.onBrandSelected?.call(filteredBrands[index].id);
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 32),
        itemCount: filteredBrands.length);
  }

  Widget _brandListItem({
    required Brand brand,
    required bool selected,
    VoidCallback? onTap,
  }) {
    final int productCount = ref
        .read(productControllerProvider.notifier)
        .getProductCountByBrandId(brand.id);
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: COLOR_PRIMARY_200,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: SvgNetworkImage(
                      imageUrl: brand.imageUrl,
                      size: 32,
                      imageColor: COLOR_PRIMARY,
                    ),
                  )),
            ),
            if (selected)
              const Positioned(
                bottom: -12,
                right: -20,
                child: ShoeslyIconButton(
                  assetImagePath: a_tick_circle_filled,
                ),
              )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          brand.name,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        Text('$productCount Items',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: COLOR_PRIMARY_300,
                ))
      ],
    );
  }
}
