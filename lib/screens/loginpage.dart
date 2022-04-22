import 'package:firebase_normal_authentication/controller.dart/auth_controller.dart';
import 'package:firebase_normal_authentication/screens/signuppage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginPage"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "email"),
            controller: emailcontroller,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "password"),
            controller: passwordcontroller,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                AuthController.authController.login(emailcontroller.text.trim(),
                    passwordcontroller.text.trim());
              },
              child: const Text("Login")),
          ElevatedButton(
              onPressed: () {
                Get.to(() => SignuPage());
              },
              child: const Text("signup")),
        ],
      ),
    );
  }
}
