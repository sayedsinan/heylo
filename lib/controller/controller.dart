import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatControll extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final TextEditingController emailText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();
  final TextEditingController singUpemailText = TextEditingController();
  final TextEditingController signUpasswordText = TextEditingController();
  final TextEditingController conforimpasswordText = TextEditingController();
  Future<UserCredential> signINwithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  singIN() async {
    try {
      await signINwithEmailandPassword(
        emailText.text,
        passwordText.text,
      );
    } catch (e) {}
  }

  Future<UserCredential> createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuth catch (e) {
      throw Exception(e);
    }
  }

  signUp(BuildContext context) async {
    if (signUpasswordText != conforimpasswordText) {
      return ScaffoldMessenger(
        child: SnackBar(
          content: Text(
            "password does not match",
          ),
        ),
      );

      }
      try{
        await createAccount(singUpemailText.text, signUpasswordText.text);

      }catch(e){

      }
  }

  void login() {}
  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
