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
        title: Text(
          "Users",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.redAccent),
            onPressed: () {
              Get.to(() => FavouriteUsersPage());
            },
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Get.offAll(() => LoginPage());
            },
          ),
        ],
      ),
      body: Obx(() {
        return userController.users.isEmpty
            ? Center(
          child: Text(
            "No users available.",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        )
            : ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            final user = userController.users[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    user.username[0].toUpperCase(),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                title: Text(
                  user.username,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  user.email,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                trailing: IconButton(
                  icon: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                    child: Icon(
                      user.isFavorite ? Icons.favorite : Icons.favorite_border,
                      key: ValueKey<bool>(user.isFavorite),
                      color: user.isFavorite ? Colors.redAccent : Colors.grey,
                      size: 28,
                    ),
                  ),
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
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Get.to(() => SignUpPage());
        },
        icon: Icon(Icons.add, color: Colors.white),
        label: Text("Add User", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
