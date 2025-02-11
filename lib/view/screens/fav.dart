import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../conroller/fav.dart';


class FavoriteUsersPage extends StatelessWidget {
  final FavoriteController controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Users")),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.favoriteUsers.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.favoriteUsers[index].username),
              subtitle: Text(controller.favoriteUsers[index].email),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.removeFavoriteUser(controller.favoriteUsers[index].id!),
              ),
            );
          },
        );
      }),
    );
  }
}
