import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:chat_app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatControll>();
    var sizeof = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: sizeof.size.height * 0.03),
                  Icon(Icons.person,
                      size: sizeof.size.height * 0.1, color: Colors.grey[800]),
                  SizedBox(height: sizeof.size.height * 0.03),
                  const Text(
                    "Welcome ",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: sizeof.size.height * 0.03),
                  MyTextField(
                    controller: controller.singUpemailText,
                    obscureText: false,
                    hintText: 'email',
                  ),
                  SizedBox(height: sizeof.size.height * 0.03),
                  MyTextField(
                    controller: controller.signUpasswordText,
                    obscureText: true,
                    hintText: 'Password',
                  ),
                  SizedBox(height: sizeof.size.height * 0.03),
                  MyTextField(
                    controller: controller.conforimpasswordText,
                    obscureText: true,
                    hintText: ' Re-EnterPassword',
                  ),
                  SizedBox(height: sizeof.size.height * 0.03),
                  MyButton(
                    onTap: () {
                      controller.signUp(context);
                    },
                    text: "Sign up",
                  ),
                  SizedBox(height: sizeof.size.height * 0.03),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
