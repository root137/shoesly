import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_appbar.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';
import 'package:shoesly/core/widgets/shoesly_outlined_button.dart';
import 'package:shoesly/features/filter/controller/filter_controller.dart';
import 'package:shoesly/features/filter/widgets/brand_widget.dart';
import 'package:shoesly/features/filter/widgets/color_chip_widget.dart';
import 'package:shoesly/features/filter/widgets/filter_chip_widget.dart';
import 'package:shoesly/features/filter/widgets/price_range_selector.dart';
import 'package:shoesly/features/product/features/product_list/controller/product_list_controller.dart';

enum SortByEnum {
  mostRecent("Most Recent"),
  lowestPrice("Lowest Price"),
  highestPrice("Highest Price");

  final String name;
  const SortByEnum(this.name);
}

enum SortByGenderEnum {
  male("Male"),
  female("Female"),
  unisex("Unisex  ");

  final String gender;
  const SortByGenderEnum(this.gender);
}

enum SortByColorEnum {
  black('Black', '000000'),
  white('White', 'FFFFFF'),
  red('Red', 'FF0000'),
  blue('Blue', '0000FF'),
  green('Green', '008000'),
  gray('Gray', '808080');

  final String colorName;
  final String colorValue;

  const SortByColorEnum(
    this.colorName,
    this.colorValue,
  );
}

class FilterPage extends ConsumerStatefulWidget {
  const FilterPage({super.key});

  @override
  ConsumerState<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends ConsumerState<FilterPage> {
  @override
  Widget build(BuildContext context) {
    const List<SortByEnum> sortByValues = SortByEnum.values;
    const List<SortByGenderEnum> genderValues = SortByGenderEnum.values;
    const height20 = SizedBox(
      height: 20,
    );
    final style = Theme.of(context)
        .textTheme
        .headlineMedium
        ?.copyWith(fontWeight: FontWeight.w600);
    return Scaffold(
      appBar: ShoeslyAppbar(
        centreTitle: true,
        title: s_filter,
        backgroundColor: COLOR_PRIMARY_100.withOpacity(0.4),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: COLOR_PRIMARY_100.withOpacity(0.4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  s_brands,
                  style: style,
                ),
              ),
              height20,
              SizedBox(
                height: 100,
                child: BrandWidget(
                  onBrandSelected: (brandId) {
                    ref
                        .read(filterControllerProvider.notifier)
                        .updateFilterArgs(brandId: brandId);
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  s_priceRange,
                  style: style,
                ),
              ),
              height20,
              PriceRangeSelector(
                onPriceRangeSelected: (start, end) {
                  ref
                      .read(filterControllerProvider.notifier)
                      .updateFilterArgs(minPrice: start, maxPrice: end);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  s_sortBy,
                  style: style,
                ),
              ),
              height20,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: sortByValues
                      .map(
                        (e) => FilterChipWidget(
                          label: e.name,
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  s_Gender,
                  style: style,
                ),
              ),
              height20,
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: genderValues
                        .map((e) => FilterChipWidget(
                              label: e.gender,
                            ))
                        .toList(),
                  )),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  s_color,
                  style: style,
                ),
              ),
              height20,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: SortByColorEnum.values
                      .map(
                        (e) => ColorChipWidget(
                          colorName: e.colorName,
                          colorValue: e.colorValue,
                        ),
                      )
                      .toList(),
                ),
              ),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ShoeslyOutlinedButton(
                text: s_reset,
                onPressed: () {},
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: ShoeslyElevatedButton(
                text: s_apply,
                isLoading: ref.watch(productControllerProvider).isLoading,
                onPressed: () async {
                  await ref
                      .read(productControllerProvider.notifier)
                      .filterProducts(ref.read(filterControllerProvider));
                  context.pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
