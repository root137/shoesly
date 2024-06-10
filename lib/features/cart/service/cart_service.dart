import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesly/core/constants/firebase_constants.dart';
import 'package:shoesly/core/providers/firebase_providers.dart';
import 'package:shoesly/core/utils/custom_firebase_exception.dart';
import 'package:shoesly/features/cart/model/cart.dart';

final cartServiceProvider = Provider<CartService>((ref) {
  return CartService(ref);
});

class CartService {
  const CartService(this.ref);
  final Ref ref;

  CollectionReference get _cartCollection =>
      ref.read(firestoreProvider).collection(FirebaseConstants.cartCollection);

  Future<List<Cart>> fetchCartItems() async {
    try {
      QuerySnapshot snapshot = await _cartCollection.get();
      return snapshot.docs.map((doc) {
        return Cart.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (error) {
      debugPrint('Error fetching cart items: $error');
      throw CustomFirebaseException(message: error.toString());
    }
  }

  Future<void> addToCart(Cart cart) async {
    try {
      await _cartCollection.doc(cart.id).set(cart.toJson());
    } catch (error) {
      debugPrint('Error adding to cart: $error');
      throw CustomFirebaseException(message: error.toString());
    }
  }

  Future<void> removeFromCart(Cart cart) async {
    try {
      await _cartCollection.doc(cart.id).delete();
    } catch (error) {
      debugPrint('Error removing from cart: $error');
      throw CustomFirebaseException(message: error.toString());
    }
  }
}
