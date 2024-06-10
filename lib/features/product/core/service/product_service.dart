import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/constants/firebase_constants.dart';
import 'package:shoesly/core/providers/firebase_providers.dart';
import 'package:shoesly/core/utils/custom_firebase_exception.dart';
import 'package:shoesly/features/filter/controller/filter_state.dart';
import 'package:shoesly/features/filter/filter_page.dart';
import 'package:shoesly/features/product/core/model/product.dart';

final productServiceProvider = Provider(
  (ref) => ProductService(ref),
);

class ProductService {
  ProductService(this.ref);

  final Ref ref;

  CollectionReference get _productCollection => ref
      .read(firestoreProvider)
      .collection(FirebaseConstants.productCollection);

  Future<List<Product>> fetchProducts(String? brandId) async {
    try {
      QuerySnapshot snapshot;
      if (brandId != null) {
        snapshot =
            await _productCollection.where('brandId', isEqualTo: brandId).get();
      } else {
        snapshot = await _productCollection.get();
      }

      return snapshot.docs.map((doc) {
        return Product.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint('prdouctFetchError: $error');
      throw CustomFirebaseException(message: error.toString());
    }
  }

  Future<List<Product>> filterProducts(FilterArgs filterArgs) async {
    try {
      Query query = _productCollection;

      if (filterArgs.brandId != null) {
        query = query.where('brandId', isEqualTo: filterArgs.brandId);
      }
      if (filterArgs.minPrice != null) {
        query =
            query.where('price', isGreaterThanOrEqualTo: filterArgs.minPrice);
      }
      if (filterArgs.maxPrice != null) {
        query = query.where('price', isLessThanOrEqualTo: filterArgs.maxPrice);
      }
      if (filterArgs.sortByGender != null) {
        query =
            query.where('gender', isEqualTo: filterArgs.sortByGender!.gender);
      }
      if (filterArgs.sortByColor != null) {
        query = query.where('colors', arrayContains: filterArgs.sortByColor);
      }

      // Add sorting logic here
      if (filterArgs.sortBy == SortByEnum.mostRecent) {
        query = query.orderBy('createdAt', descending: true);
      } else if (filterArgs.sortBy == SortByEnum.lowestPrice) {
        query = query.orderBy('price', descending: false);
      } else if (filterArgs.sortBy == SortByEnum.highestPrice) {
        query = query.orderBy('price', descending: true);
      }

      final querySnapshot = await query.get();
      return querySnapshot.docs.map((doc) {
        return Product.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint('productFetchError: $error');
      throw CustomFirebaseException(message: error.toString());
    }
  }
}
