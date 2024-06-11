import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/utils/custom_firebase_exception.dart';
import 'package:shoesly/features/review/model/review.dart';
import 'package:shoesly/features/review/service/review_service.dart';

final reviewListNotifierProvider = StateNotifierProvider.autoDispose<
    ReviewListNotifier, AsyncValue<List<Review>>>((ref) {
  return ReviewListNotifier(ref);
});

class ReviewListNotifier extends StateNotifier<AsyncValue<List<Review>>> {
  ReviewListNotifier(
    this.ref,
  ) : super(
          const AsyncValue.loading(),
        );

  final Ref ref;

  Future<void> fetchReviews(String? productId) async {
    try {
      debugPrint('productId: $productId');
      state = const AsyncLoading();
      final List<Review> reviews =
          await ref.read(reviewServiceProvider).fetchReviews(productId);

      state = AsyncValue.data(reviews);
    } on CustomFirebaseException catch (ex) {
      debugPrint('reviewFetchError: ${ex.message}');
      state = AsyncError(ex.message, StackTrace.current);
    } catch (error) {
      debugPrint('reviewFetchErrorrr: $error');
      state = AsyncError(error, StackTrace.current);
    }
  }

  /// get top 3 reviews of that product based on rating
  Future<void> fetchTopReviews(String productId) async {
    try {
      state = const AsyncLoading();
      final List<Review> reviews =
          await ref.read(reviewServiceProvider).fetchTopReviews(productId);

      state = AsyncValue.data(reviews);
    } on CustomFirebaseException catch (ex) {
      debugPrint('reviewFetchError: ${ex.message}');
      state = AsyncError(ex.message, StackTrace.current);
    } catch (error) {
      debugPrint('reviewFetchErrorrr: $error');
      state = AsyncError(error, StackTrace.current);
    }
  }
}
