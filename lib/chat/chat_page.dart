import 'package:chat_app/controller/chatController.dart';
import 'package:chat_app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatControll>();
    final secondcontroller = Get.find<ChatSupport>();
    final email = controller.firebaseAuth.currentUser?.email ?? 'Unknown';
    return Scaffold(
      // backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          leading: null,
          centerTitle: true,
          title: Text(email.split('@').first),
        ),
        body:   GetBuilder<ChatSupport>(
          builder: (builder ) {
            return Column(
                children: [
                  Expanded(child: secondcontroller.buildeMesseageList()),
                  secondcontroller.builtMesseageInput()
                ],
              );
          }
        
        )
        );
  }
}
