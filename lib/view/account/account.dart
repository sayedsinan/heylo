import 'package:chat_app/controller/controller.dart';
import 'package:chat_app/view/account/adding%20_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDetailsScreen extends StatelessWidget {
  final _themeController = Get.find<ChatControll>();

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ChatControll>();
    var sizeof = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Details'),
        actions: [
          IconButton(
            icon: Obx(() => _themeController.isDarkMode.value
                ? Icon(Icons.wb_sunny)
                : Icon(Icons.nightlight_round)),
            onPressed: _themeController.toggleTheme,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: sizeof.size.height * 0.1,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                  ),
                  Positioned(
                    top: 70,
                    left: 60,
                    child: Icon(
                      Icons.edit,
                    ),
                  )
                ],
              ),
            ],
          ),
          ListTile(
            title: Center(
              child: Text(
                controller.firebaseAuth.currentUser!.email!.split("@")[0],
                style: TextStyle(
                  color: _themeController.getTextColor(),
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 2,
          ),
          ListTile(
            title: Center(
              child: Text(
                'About',
                style: TextStyle(
                  color: _themeController.getTextColor(),
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeof.size.height * 0.2,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(const AddingSection());
            },
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
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
            child: Text('Click to Edit'),
          )
        ],
      ),
    );
  }
}
