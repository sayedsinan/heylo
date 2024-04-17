import 'package:chat_app/chat/chat_bubble.dart';
import 'package:chat_app/color.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:chat_app/controller/chatController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPageIndex extends StatefulWidget {
  const ChatPageIndex({
    super.key,
    required this.recivername,
    required this.reciveruid,
  });
  final String recivername;
  final String reciveruid;

  @override
  State<ChatPageIndex> createState() => _ChatPageIndexState();
}

class _ChatPageIndexState extends State<ChatPageIndex> {
  final FirebaseAuth fireAut = FirebaseAuth.instance;
  final secondcontroller = Get.find<ChatSupport>();
  final TextEditingController message = TextEditingController();
  void sendMessage() async {
    if (message.text.isNotEmpty) {
      await secondcontroller.sendMesseage(widget.reciveruid, message.text);
      message.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: maincolor,
          leading: null,
          centerTitle: true,
          title: Text(widget.recivername.split('@')[0].toString()),
        ),
        body: GetBuilder<ChatSupport>(builder: (builder) {
          return Column(
            children: [
              Expanded(child: buildeMesseageList()),
              builtMesseageInput()
            ],
          );
        }));
  }

  Widget builtMesseageInput() {
    return Row(
      children: [
        Expanded(
          child: MyTextField(
            controller: message,
            hintText: 'Enter Message',
            obscureText: false,
          ),
        ),
        IconButton(onPressed: sendMessage, icon: Icon(Icons.send))
      ],
    );
  }

  Widget buildeMesseageList() {
    return StreamBuilder(
      stream: secondcontroller.getMesseage(
          widget.reciveruid, fireAut.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData) {
          return Text("No data available");
        }

        // Convert the generic snapshot to a QuerySnapshot
        QuerySnapshot querySnapshot = snapshot.data as QuerySnapshot;

        // Access the list of documents
        List<DocumentSnapshot> docs = querySnapshot.docs;

        // Build a ListView with the document data
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (BuildContext context, int index) {
            Map<String, dynamic> data =
                docs[index].data() as Map<String, dynamic>;

            var alignment = (data['senderId'] == fireAut.currentUser!.uid)
                ? Alignment.centerRight
                : Alignment.centerLeft;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: alignment,
                child: Column(
                  children: [
                 ChatBubble(messeage: data['message'])
                 //  ,  Text(DateTime.now().toString())
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget builtMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == fireAut.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('hello'),
            Text(data['message']),
          ],
        ),
      ),
    );
  }

  Widget buildUserList() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
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

  Widget buildUserItem(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null && document.data()!.containsKey('email')) {
      final data = document.data()!;
      if (fireAut.currentUser!.email != data['email']) {
        return Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: ListTile(
            tileColor: Colors.blueGrey[800],
            title: Text(data['email'] ?? 'No email found'),
          ),
        );
      }
    }
    return SizedBox
        .shrink(); // Return an empty SizedBox if data is null or email is not found
  }
}
