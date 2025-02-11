import 'package:get/get.dart';

import '../models/usermodel.dart';
import '../view/screens/databasehelper.dart';

class AuthController extends GetxController {
  final DBHelper dbHelper = DBHelper();

  var users = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  void loadUsers() async {
    users.value = await dbHelper.getUsers();
  }

  void addUser(UserModel user) async {
    await dbHelper.insertUser(user);
    loadUsers();
  }

  void deleteUser(int id) async {
    await dbHelper.deleteUser(id);
    loadUsers();
  }
}
