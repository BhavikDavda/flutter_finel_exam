import 'package:flutter/material.dart';
import 'package:flutter_finel_exam/view/screens/splashscreen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'conroller/auth.dart';
import 'conroller/fav.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(UserController());
  Get.put(FavoriteController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Favorite Users App',
      home: SplashScreen(),
    );
  }
}
