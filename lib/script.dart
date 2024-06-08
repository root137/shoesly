import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shoesly/core/constants/firebase_constants.dart';
import 'package:uuid/uuid.dart';

Future<void> uploadBrandsToFirestore() async {
  // Load JSON file from assets
  final String response =
      await rootBundle.loadString('assets/jsons/brands.json');
  final List<dynamic> products = json.decode(response);

  // Reference to Firestore collection
  CollectionReference productCollection = FirebaseFirestore.instance
      .collection(FirebaseConstants.productCollection);

  try {
// Upload each brand to Firestore
    for (var product in products) {
      await productCollection.add({
        'id': const Uuid().v4(),
        'name': product['name'],
        'brandId': '',
        'reviewId': '',
        'price': product['price'],
        'imageUrls': product['imageUrls'],
        'sizes': product['sizes'],
        'description': product['description'],
        'colors': product['colors'],
        'gender': product['gender'],
        'averageRating': product['averageRating'],
        'reviewCount': product['reviewCount'],
      });
    }
  } catch (ex) {
    debugPrint('Error: $ex');
  }
}
