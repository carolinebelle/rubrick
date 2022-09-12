import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel?> get onAuthStateChanged {
    return _docUserStream(_auth.authStateChanges());
  }

  Stream<UserModel?> _docUserStream(Stream<User?> currentUser) async* {
    await for (final value in currentUser) {
      UserModel user = await _getUserModel(value!);
      yield user;
    }
  }

  Future<UserModel> _getUserModel(User user) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot userDoc = await users.doc(user.uid).get();

    return UserModel.fromDocument(userDoc);
  }
}
