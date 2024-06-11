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
  final List<dynamic> user = json.decode(response);

  // Reference to Firestore collection
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection(FirebaseConstants.usersCollection);

  try {
// Upload each brand to Firestore
    for (var user in user) {
      await userCollection.add({
        'id': const Uuid().v4(),
        'name': user['name'],
        'imageUrl': user['imageUrl'],
      });
    }
  } catch (ex) {
    debugPrint('Error: $ex');
  }
}
