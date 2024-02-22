import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_text_field.dart';
import 'package:chat_app/controller/controller.dart';
import 'package:chat_app/view/signUp/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: sizeof.size.height * 0.03),
                Icon(Icons.person,
                    size: sizeof.size.height * 0.1, color: Colors.grey[800]),
                SizedBox(height: sizeof.size.height * 0.03),
                Text(
                  "Welcome back We missed you",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: sizeof.size.height * 0.03),
                MyTextField(
                  controller: controller.emailText,
                  obscureText: false,
                  hintText: 'email',
                ),
                SizedBox(height: sizeof.size.height * 0.03),
                MyTextField(
                  controller: controller.passwordText,
                  obscureText: true,
                  hintText: 'Password',
                ),
                SizedBox(height: sizeof.size.height * 0.03),
                MyButton(
                  onTap: () {
                    controller.singIN();
                  },
                  text: "Sign In",
                ),
                SizedBox(height: sizeof.size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a Member?",
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const SignUp());
                      },
                      child: const Text(
                        "Sign up",
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
    );
  }
}