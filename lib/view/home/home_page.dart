import 'package:chat_app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatControll>();
    return Scaffold(
      body: Column(
     
        children: [
        SafeArea(
          child: ElevatedButton(
              onPressed: () {
                controller.logout();
              },
              child: Text("logut")),
        )
      ]),
    );
  }
}
