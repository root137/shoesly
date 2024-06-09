import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/router/routes.dart';
import 'package:shoesly/core/themes/app_colors.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';

class ShoeslyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ShoeslyAppbar({
    super.key,
    this.leadingIcon = true,
    this.centreTitle = false,
    this.backgroundColor = COLOR_WHITE,
    this.title,
    this.actions,
    this.titleTextStyle,
  });

  final bool? leadingIcon;
  final String? title;
  final Widget? actions;
  final TextStyle? titleTextStyle;
  final bool centreTitle;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: leadingIcon!
          ? ShoeslyIconButton(
              assetImagePath: a_back_button,
              onPressed: () {
                context.canPop()
                    ? context.pop()
                    : context.goNamed(
                        Routes.productListPage.name,
                      );
              },
            )
          : null,
      centerTitle: centreTitle,
      title: title != null
          ? Text(
              title!,
              style:
                  titleTextStyle ?? Theme.of(context).textTheme.headlineMedium,
            )
          : null,
      actions: actions != null ? [actions!] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
