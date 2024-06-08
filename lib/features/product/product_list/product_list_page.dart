import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_appbar.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';
import 'package:shoesly/features/product/product_list/widgets/product_item.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleTextStyle = Theme.of(context).textTheme.displayMedium;
    return Stack(
      children: [
        Scaffold(
          appBar: ShoeslyAppbar(
            title: s_discover,
            titleTextStyle: titleTextStyle,
            leadingIcon: false,
            centreTitle: false,
            actions: ShoeslyIconButton(
              assetImagePath: a_cart,
              onPressed: () {},
            ),
          ),
          body: const ProductItem(),
        ),
        Positioned.fill(
          bottom: 30,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ShoeslyElevatedButton(
              height: 40,
              width: 150,
              icon: const ShoeslyIconButton(
                size: 20,
                iconColor: COLOR_WHITE,
                assetImagePath: a_filter,
              ),
              text: s_filter,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
