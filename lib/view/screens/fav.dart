import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../conroller/fav.dart';

class FavouriteUsersPage extends StatelessWidget {
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Favourite Users", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Obx(() {
        if (favoriteController.favoriteUsers.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border, size: 60, color: Colors.grey),
                SizedBox(height: 10),
                Text("No favorite users yet!", style: TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: favoriteController.favoriteUsers.length,
            itemBuilder: (context, index) {
              final user = favoriteController.favoriteUsers[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      user.username[0].toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  title: Text(
                    user.username,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      favoriteController.removeFromFavorites(user.id!);
                      Get.snackbar(
                        "Removed",
                        "${user.username} removed from favorites",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
