


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {

  final FirebaseAuth _auth  = FirebaseAuth.instance;
  Future<void> createUserWithEmailPassword(String email, String password) async {

      await _auth.createUserWithEmailAndPassword(email: email, password: password);

  }

  Future<void> signInUserWithEmailPassword(String email , String password)async {


      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) =>
      {

      });


  }
}