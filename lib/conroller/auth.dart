import 'package:get/get.dart';

import '../models/usermodel.dart';

import '../view/screens/databasehelper.dart';

class UserController extends GetxController {
  var users = <UserModel>[].obs;
  final dbHelper = DatabaseHelper();

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    users.value = await dbHelper.getUsers();
  }

  void addUser(UserModel user) async {
    await dbHelper.insertUser(user);
    fetchUsers();
  }

  void updateUser(UserModel user) async {
    await dbHelper.updateUser(user);
    fetchUsers();
  }

  void deleteUser(int id) async {
    await dbHelper.deleteUser(id);
    fetchUsers();
  }
}
