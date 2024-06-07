import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';

class ShoeslyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ShoeslyAppbar({
    super.key,
    this.leadingIcon = true,
    this.title,
    this.actions,
    this.titleTextStyle,
    this.centreTitle = false,
  });

  final bool? leadingIcon;
  final String? title;
  final Widget? actions;
  final TextStyle? titleTextStyle;
  final bool centreTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: leadingIcon!
          ? ShoeslyIconButton(
              assetImagePath: a_back_button,
              onPressed: () {
                context.canPop()
                    ? context.pop()
                    : context.go(
                        '/product-list',
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
