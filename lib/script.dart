import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

Future<void> uploadBrandsToFirestore() async {
  // Load JSON file from assets
  final String response =
      await rootBundle.loadString('assets/jsons/brands.json');
  final List<dynamic> brands = json.decode(response);

  // Reference to Firestore collection
  CollectionReference brandsCollection =
      FirebaseFirestore.instance.collection('brands');

  try {
// Upload each brand to Firestore
    for (var brand in brands) {
      await brandsCollection.add({
        'id': const Uuid().v4(),
        'name': brand['name'],
        'imageUrl': brand['imageUrl'],
      });
    }
  } catch (ex) {
    debugPrint('Error: $ex');
  }
}
