import 'package:chat_app/chat/chat_page.dart';
import 'package:chat_app/view/home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<UserCredential> signINwithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      firebaseFirestore.collection('users').doc(userCredential.user!.uid).set({
        'id': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  singIN(BuildContext context) async {
    try {
      await signINwithEmailandPassword(
        emailText.text,
        passwordText.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sign-in Error'),
            content: const Text(
                'An error occurred while signing in. Please try again.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<UserCredential> createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      firebaseFirestore.collection('users').doc(userCredential.user!.uid).set({
        'id': userCredential.user!.uid,
        'email': email,
      });
      return userCredential;
    } on FirebaseAuth catch (e) {
      throw Exception(e);
    }
  }

  Widget buildUserList() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => buildUserItem(doc))
                .toList(),
          );
        });
  }

  Widget buildUserItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (firebaseAuth.currentUser!.email != data['email']) {
      return Padding(
        padding: const EdgeInsets.only(top: 8,bottom: 8),
        child: ListTile(
          tileColor: Colors.blueGrey[800],
          title: Text(data['email']),
          onTap: () => Get.to(ChatPage()),
        ),
      );
    } else {
      return Container();
    }
  }

  Future<void> signUp(BuildContext context) async {
    if (signUpasswordText.text != conforimpasswordText.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }
    try {
      await createAccount(singUpemailText.text, signUpasswordText.text);
      Get.to(const HomePage());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("This email address is already in use"),
      ));
    }
  }

  Future<void> resetPassword() async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: emailText.text);
    } catch (error) {
      print('Error sending password reset email: $error');
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
