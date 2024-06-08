import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/features/brand/controller/brand_controller.dart';
import 'package:shoesly/features/brand/model/brand.dart';

class BrandsListWidget extends ConsumerStatefulWidget {
  const BrandsListWidget({this.onBrandSelected, super.key});

  final ValueSetter<String?>? onBrandSelected;

  @override
  ConsumerState<BrandsListWidget> createState() => _BrandsListWidgetState();
}

class _BrandsListWidgetState extends ConsumerState<BrandsListWidget> {
  int _selectedBrandIndex = 0;

  @override
  Widget build(BuildContext context) {
    final asyncBrands = ref.watch(brandControllerProvider);
    return asyncBrands.when(
        data: (brands) {
          return _buildBrandList(brands);
        },
        error: (error, _) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator.adaptive());
  }

  SizedBox _buildBrandList(List<Brand> brands) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 24),
        itemBuilder: (_, index) {
          final bool brandSelected = index == _selectedBrandIndex;
          return InkWell(
            onTap: () {
              setState(() {
                _selectedBrandIndex = index;
              });
              widget.onBrandSelected
                  ?.call(index == 0 ? null : brands[index].id);
            },
            child: Text(
              brands[index].name,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: brandSelected ? COLOR_PRIMARY : COLOR_PRIMARY_300,
                  ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemCount: brands.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
