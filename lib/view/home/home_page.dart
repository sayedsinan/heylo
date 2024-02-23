import 'package:chat_app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatControll>();
    return Scaffold(
        backgroundColor: Colors.blueGrey[400],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          centerTitle: true,
          title: Text(
            "Welcome ${controller.firebaseAuth.currentUser!.email?.split("@")[0]}",
          ),
          
          actions: [
            IconButton(
                onPressed: () {
                  controller.logout();
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: controller.buildUserList());
  }
}
