import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../conroller/fav.dart';


class FavouriteUsersPage extends StatelessWidget {
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favourite Users"),
        centerTitle: true,

      ),
      body: Obx(() {
        if (favoriteController.favoriteUsers.isEmpty) {
          return Center(child: Text("No favorite users"));
        }

        return ListView.builder(
          itemCount: favoriteController.favoriteUsers.length,
          itemBuilder: (context, index) {
            final user = favoriteController.favoriteUsers[index];
            return ListTile(
              title: Text(user.username),
              subtitle: Text(user.email),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  favoriteController.removeFromFavorites(user.id!);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
