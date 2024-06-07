import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/widgets/shoesly_appbar.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleTextStyle = Theme.of(context).textTheme.displayMedium;
    return Scaffold(
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
      body: const Center(
        child: Text(
          'Product List',
        ),
      ),
    );
  }
}
