import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/resources/strings.dart';
import 'package:shoesly/core/widgets/shoesly_appbar.dart';
import 'package:shoesly/features/review/controller/review_controller.dart';
import 'package:shoesly/features/review/widgets/rating_list_widget.dart';
import 'package:shoesly/features/review/widgets/user_review_widget.dart';
import 'package:shoesly/features/user/controller/user_controller.dart';

class ReviewPage extends ConsumerStatefulWidget {
  const ReviewPage({
    this.productId,
    super.key,
  });

  final String? productId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReviewpageState();
}

class _ReviewpageState extends ConsumerState<ReviewPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(reviewListNotifierProvider.notifier)
          .fetchReviews(widget.productId);

      ref.read(userListNotifierProvider.notifier).fetchUsers();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reviewAsync = ref.watch(reviewListNotifierProvider);
    final reviewCount = reviewAsync.maybeWhen(
      data: (reviews) => reviews.length,
      orElse: () => 0,
    );

    return Scaffold(
      appBar: ShoeslyAppbar(
        centreTitle: true,
        title: '$s_review ${"(${reviewCount.toString()})"}',
        actions: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              const Icon(
                Icons.star_rounded,
                size: 20,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '4.5',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const RatingListWidget(),
          reviewAsync.when(
            data: (reviews) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final review = reviews[index];
                    final user = ref
                        .read(userListNotifierProvider.notifier)
                        .getUserById(review.userId);
                    return UserReviewWidget(
                      name: user?.name ?? '',
                      date: review.createdAt,
                      description: review.description,
                      imageUrl: user?.imageUrl,
                      rating: review.rating,
                    );
                  },
                  itemCount: reviews.length,
                ),
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
        ],
      ),
    );
  }

  /// method to calculate average rating
  double calculateAverageRating(List<double> ratings) {
    final totalRating =
        ratings.fold(0.0, (previousValue, element) => previousValue + element);
    return totalRating / ratings.length;
  }
}
