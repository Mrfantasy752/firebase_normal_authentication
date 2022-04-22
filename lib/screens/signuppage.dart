import 'package:firebase_normal_authentication/controller.dart/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignuPage extends StatefulWidget {
  const SignuPage({Key? key}) : super(key: key);

  @override
  State<SignuPage> createState() => _SignuPageState();
}

class _SignuPageState extends State<SignuPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  void initState() {
    Get.put(AuthController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp Page"),
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
          // ElevatedButton(onPressed: () {}, child: Text("Login")),
          ElevatedButton(
              onPressed: () {
                AuthController.authController.signup(
                    emailcontroller.text.trim(),
                    passwordcontroller.text.trim());
              },
              child: const Text("signup")),
        ],
      ),
    );
  }
}
