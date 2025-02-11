import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../conroller/auth.dart';

import 'loginpage.dart';


class HomePage extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.users[index].username),
              subtitle: Text(controller.users[index].email),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.deleteUser(controller.users[index].id!),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(SignUpPage());
        },
      ),
    );
  }
}
