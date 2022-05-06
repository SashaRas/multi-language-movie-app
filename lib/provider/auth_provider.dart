import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_app/ui/login_page.dart';

class FirebaseAuthProvider extends ChangeNotifier{
  Future<bool> registerUser(String email, String password) async {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
        FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }
}