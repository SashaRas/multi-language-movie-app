import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CrudProvider extends ChangeNotifier {
  Future<bool> addElement(String img, String overview, String title,
      String date, String vote) async {
    try {
      FirebaseFirestore.instance
          .collection("All Users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('Data')
          .add({
        'Image': img,
        'Title': title,
        'Overview': overview,
        'Release date': date,
        'Vote average': vote
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> removeElement(String id) async {
    try {
      FirebaseFirestore.instance
          .collection('All Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Data')
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }
}
