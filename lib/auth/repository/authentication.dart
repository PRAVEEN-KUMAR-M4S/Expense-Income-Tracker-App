import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/constants/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// create user
  Future<void> signUpUser(
    String email,
    String password,
  ) async {
    try {
      
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
     
    } on FirebaseAuthException catch (e) {
      throw e.message.toString();
    }
    return null;
  }

  ///signOutUser
  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }

  Future<void> regUser(BuildContext context, String email, String password,
      String confirmPassword,String name) async {
    if (password != confirmPassword) {
      showSnackBar(context, 'Passwords do not match');
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await addUserDetails(
        name,email
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email';
      }
      showSnackBar(context,errorMessage);
    } catch (e) {
      showSnackBar(context,'An error occurred');
    }
  }

  Future<void> addUserDetails(String name, String email) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set({
      'name': name,
      'email': email,
      'expense':0.0,
      'income':0.0,
      'totalBalance':0.0
    });
  }
}
