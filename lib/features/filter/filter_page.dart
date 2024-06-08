import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_appbar.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';
import 'package:shoesly/core/widgets/shoesly_outlined_button.dart';
import 'package:shoesly/features/filter/widgets/brand_widget.dart';
import 'package:shoesly/features/filter/widgets/color_chip_widget.dart';
import 'package:shoesly/features/filter/widgets/filter_chip_widget.dart';

class FilterPage extends ConsumerWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const height20 = SizedBox(
      height: 20,
    );
    final style = Theme.of(context).textTheme.headlineMedium;
    return Scaffold(
      appBar: const ShoeslyAppbar(
        centreTitle: true,
        title: s_filter,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: COLOR_PRIMARY_100.withOpacity(0.4),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s_brands,
                style: style,
              ),
              height20,
              const BrandWidget(),
              const SizedBox(
                height: 30,
              ),
              Text(
                s_priceRange,
                style: style,
              ),
              height20,
              //todo: add range selector here
              const SizedBox(
                height: 30,
              ),
              Text(
                s_sortBy,
                style: style,
              ),
              height20,
              const FilterChipWidget(),
              const SizedBox(
                height: 30,
              ),
              Text(
                s_Gender,
                style: style,
              ),
              height20,
              const FilterChipWidget(),
              const SizedBox(
                height: 30,
              ),
              Text(
                s_color,
                style: style,
              ),
              height20,
              const ColorChipWidget(),
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
                text: s_addToCart,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
