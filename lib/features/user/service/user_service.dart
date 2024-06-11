import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/constants/firebase_constants.dart';
import 'package:shoesly/core/providers/firebase_providers.dart';
import 'package:shoesly/core/utils/custom_firebase_exception.dart';
import 'package:shoesly/features/user/model/user.dart';

final userServiceProvider = Provider((ref) => UserService(ref));

class UserService {
  const UserService(this.ref);
  final Ref ref;

  CollectionReference get _userCollection =>
      ref.read(firestoreProvider).collection(FirebaseConstants.usersCollection);

  Future<List<User>> fetchtodo() async {
    try {
      QuerySnapshot snapshot = await _userCollection.get();
      return snapshot.docs.map((doc) {
        return User.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint('Error fetching brands: $error');
      throw CustomFirebaseException(
        message: error.toString(),
      );
    }
  }
}
