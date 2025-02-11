import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(HomePage());
    });

    return Scaffold(
      body: Center(
        child: Text("User Management App", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
