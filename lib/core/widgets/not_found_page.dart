import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/router/routes.dart';
import 'package:shoesly/core/widgets/shoesly_elevated_button.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              s_oops,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                s_404NotFound,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
            const SizedBox(height: 20.0),
            ShoeslyElevatedButton(
              width: 150,
              text: s_goToHome,
              onPressed: () {
                context.goNamed(Routes.productListPage.name);
              },
            )
          ],
        ),
      ),
    );
  }
}
