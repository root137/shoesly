import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/constants/firebase_constants.dart';
import 'package:shoesly/core/providers/firebase_providers.dart';
import 'package:shoesly/core/utils/custom_firebase_exception.dart';
import 'package:shoesly/features/brand/model/brand.dart';

final brandServiceProvider = Provider<BrandService>((ref) {
  return BrandService(ref);
});

class BrandService {
  const BrandService(this.ref);
  final Ref ref;

  CollectionReference get _brandCollection =>
      ref.read(firestoreProvider).collection(FirebaseConstants.brandCollection);

  Future<List<Brand>> fetchBrands() async {
    try {
      QuerySnapshot snapshot = await _brandCollection.get();
      return snapshot.docs.map((doc) {
        return Brand.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint('Error fetching brands: $error');
      throw CustomFirebaseException(message: error.toString());
    }
  }
}
