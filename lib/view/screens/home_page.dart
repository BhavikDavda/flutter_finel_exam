import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../conroller/auth.dart';
import '../../conroller/fav.dart';

import 'fav.dart';
import 'login.dart';
import 'loginpage.dart';


class HomePage extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Users"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Get.offAll(() => LoginPage()); // Go to LoginPage on Logout
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Get.to(() => FavouriteUsersPage()); // Navigate to Favorite Page
            },
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            final user = userController.users[index];
            return ListTile(
              title: Text(user.username),
              subtitle: Text(user.email),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: user.isFavorite ? Colors.red : Colors.grey),
                onPressed: () {
                  user.isFavorite = !user.isFavorite;
                  userController.updateUser(user);
                  if (user.isFavorite) {
                    favoriteController.addToFavorites(user);
                  } else {
                    favoriteController.removeFromFavorites(user.id!);
                  }
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => SignUpPage()); // Navigate to SignUp Page
        },
      ),
    );
  }
}
