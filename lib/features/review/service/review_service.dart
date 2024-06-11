import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/constants/firebase_constants.dart';
import 'package:shoesly/core/providers/firebase_providers.dart';
import 'package:shoesly/core/utils/custom_firebase_exception.dart';
import 'package:shoesly/features/review/model/review.dart';

final reviewServiceProvider = Provider((ref) => ReviewService(ref));

class ReviewService {
  ReviewService(this.ref);
  final Ref ref;

  CollectionReference get _reviewCollection => ref
      .read(firestoreProvider)
      .collection(FirebaseConstants.reviewCollection);

  Future<List<Review>> fetchReviews(String? productId) async {
    try {
      debugPrint('productId and method called service insercice: $productId');
      QuerySnapshot snapshot;
      if (productId != null) {
        snapshot = await _reviewCollection
            .where('productId', isEqualTo: productId)
            .get();
        debugPrint('snapshot: $snapshot');
      } else {
        snapshot = await _reviewCollection.get();
      }

      return snapshot.docs.map((doc) {
        debugPrint('doc.data(): ${doc.data()}');
        return Review.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint('reviewFetchError: $error');
      throw CustomFirebaseException(message: error.toString());
    }
  }

  /// get top 3 reviews of that product based on rating
  Future<List<Review>> fetchTopReviews(String productId) async {
    try {
      final snapshot = await _reviewCollection
          .where('productId', isEqualTo: productId)
          .orderBy('rating', descending: true)
          .limit(3)
          .get();

      return snapshot.docs.map((doc) {
        return Review.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint('reviewFetchError: $error');
      throw CustomFirebaseException(message: error.toString());
    }
  }
}
