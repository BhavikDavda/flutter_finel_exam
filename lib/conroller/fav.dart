import 'package:get/get.dart';

import '../models/usermodel.dart';

import '../view/screens/firestore.dart';

class FavoriteController extends GetxController {
  var favoriteUsers = <UserModel>[].obs;
  final FirebaseService firebaseService = FirebaseService();

  @override
  void onInit() {
    fetchFavorites();
    super.onInit();
  }

  void fetchFavorites() {
    firebaseService.getFavorites().listen((users) {
      favoriteUsers.value = users;
    });
  }

  void addToFavorites(UserModel user) {
    firebaseService.addFavorite(user);
    fetchFavorites(); // Refresh List
  }

  void removeFromFavorites(int id) {
    firebaseService.removeFavorite(id);
    fetchFavorites(); // Refresh List
  }
}
