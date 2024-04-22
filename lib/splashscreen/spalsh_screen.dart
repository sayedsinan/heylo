import 'dart:async';

import 'package:chat_app/color.dart';
import 'package:chat_app/services/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context);
    Timer(Duration(seconds: 3), () {
      Get.to(AuthGate());
    });
    return Scaffold(
      backgroundColor: maincolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(
              height: sizeof.size.height*0.9,
              width: sizeof.size.width*0.9,
              child: Image.asset('assets/heylo.png'))],
          )
        ],
      ),
    );
  }
}
