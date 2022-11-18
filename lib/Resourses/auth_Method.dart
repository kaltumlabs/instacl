import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up User
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,




  }) async {
    String res = 'Some Error occurred';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty  != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
        // add user in database
        await _firestore.collection('users').doc(cred.user!.uid).set(
          {
            "username": username,
            "password": password,
            "uid": cred.user!.uid,
            "email": email,
            "followers": [],
            "following" : []
          },
        );
        res = "Success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
