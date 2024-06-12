import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FetchUserDataService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserModel> fetchUserData() async {
    try {
      final docsnapshot = await _firebaseFirestore
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get();
      final data = docsnapshot.data()!;

      return UserModel.fromMap(data);
    } on FirebaseAuthException catch (e) {
      throw e.message.toString();
    }
  }
}
