import 'package:chat_app/controller/acount_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddingSection extends StatelessWidget {
  const AddingSection({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AccountController>();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 80,
                    ),
                    Positioned(
                      top: 120,
                      left: 110,
                      child: IconButton(
                          onPressed: () {
                            controller.selectImage();
                          },
                          icon: Icon(Icons.edit)),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: TextField(
                // onChanged: (newValue) => edit('username', newValue),

                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                // onChanged: (newValue) => edit('username', newValue),

                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
                  labelText: 'About',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 12.0),
                backgroundColor: Color(0xFFFFA565),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              child: Text('SAVE'),
            )
          ],
        ),
      ),
    );
  }
}
