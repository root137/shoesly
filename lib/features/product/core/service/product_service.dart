import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/constants/firebase_constants.dart';
import 'package:shoesly/core/providers/firebase_providers.dart';
import 'package:shoesly/core/utils/custom_firebase_exception.dart';
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
}
