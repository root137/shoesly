import 'package:flutter/material.dart';
import 'package:shoesly/core/resources/assets.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/themes/shoesly_theme.dart';
import 'package:shoesly/core/widgets/shoesly_icon_button.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';
import 'package:shoesly/core/widgets/shoesly_outlined_button.dart';

class ShoeslyApp extends StatelessWidget {
  const ShoeslyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ShoeslyTheme.lightThemeData,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShoeslyElevatedButton(
                text: s_apply,
                width: 150,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              ShoeslyOutlinedButton(
                text: s_reset,
                width: 150,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              const ShoeslyIconButton(
                assetImagePath: a_arrow_right,
              )
            ],
          ),
        ),
      ),
    );
  }
}
