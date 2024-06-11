import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/router/routes.dart';
import 'package:shoesly/core/widgets/shoesly_outlined_button.dart';
import 'package:shoesly/features/product/core/model/product.dart';
import 'package:shoesly/features/review/controller/review_controller.dart';
import 'package:shoesly/features/review/widgets/user_review_widget.dart';
import 'package:shoesly/features/user/controller/user_controller.dart';

class TopReviewWidget extends ConsumerStatefulWidget {
  const TopReviewWidget({super.key, required this.product});

  final Product product;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TopReviewWidgetState();
}

class _TopReviewWidgetState extends ConsumerState<TopReviewWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(reviewListNotifierProvider.notifier)
          .fetchTopReviews(widget.product.id);
      ref.read(userListNotifierProvider.notifier).fetchUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reviewAsync = ref.watch(reviewListNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$s_review (10)',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        reviewAsync.when(
          data: (reviews) {
            return Column(
              children: reviews.map((review) {
                // final user = ref
                //     .read(userListNotifierProvider.notifier)
                //     .getUserById(review.userId);
                return UserReviewWidget(
                  name: 'Hello',
                  description: review.description,
                  date: review.createdAt,
                  rating: review.rating,
                );
              }).toList(),
            );
          },
          error: (_, __) {
            return const Text('Error');
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
        const SizedBox(height: 30),
        ShoeslyOutlinedButton(
          text: s_seeAllReview,
          onPressed: () {
            context.goNamed(
              Routes.reviewPage.name,
              extra: widget.product.id,
            );
          },
        )
      ],
    );
  }

  String getFormattedDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays == 0) {
      return 'Today';
    } else {
      /// if there is - than remove it and return
      return '${difference.inDays.toString().replaceAll('-', '')} days ago';
    }
  }
}
