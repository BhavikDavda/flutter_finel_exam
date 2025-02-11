import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../conroller/auth.dart';
import '../../models/usermodel.dart';

import 'login.dart';

class SignUpPage extends StatelessWidget {
  final UserController userController = Get.find();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: usernameController, decoration: InputDecoration(labelText: "Username")),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newUser = UserModel(
                  username: usernameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );
                userController.addUser(newUser);
                Get.offAll(() => LoginPage());
              },
              child: Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
