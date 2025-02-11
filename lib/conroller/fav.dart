import 'package:get/get.dart';
import '../models/usermodel.dart';

import '../view/screens/firestore.dart';

class FavoriteController extends GetxController {
  final FirestoreService firestoreService = FirestoreService();
  var favoriteUsers = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavoriteUsers();
  }

  void loadFavoriteUsers() async {
    favoriteUsers.value = await firestoreService.getFavoriteUsers();
  }

  void addFavoriteUser(UserModel user) async {
    await firestoreService.addFavoriteUser(user);
    loadFavoriteUsers();
  }

  void removeFavoriteUser(int id) async {
    await firestoreService.removeFavoriteUser(id);
    loadFavoriteUsers();
  }
}
