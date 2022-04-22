import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_normal_authentication/screens/loginpage.dart';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

import '../screens/welcomepage.dart';

class AuthController extends GetxController {
  static AuthController authController = Get.find();
  final FirebaseAuth authinstance = FirebaseAuth.instance;
  get user => authinstance.currentUser;
  @override
  void onInit() {
    authinstance.userChanges().listen((user) {
      if (user == null) {
        Get.offAll(() => LoginPage());
      } else {
        Get.offAll(() => WelcomePage());
      }
    });
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> signup(String email, String password) async {
    try {
      await authinstance.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await authinstance.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> signout() async {
    try {
      await authinstance.signOut();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
