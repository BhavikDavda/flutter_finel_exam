import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/usermodel.dart';


class FirestoreService {
  final CollectionReference favoriteUsersCollection =
  FirebaseFirestore.instance.collection('favorite_users');

  Future<void> addFavoriteUser(UserModel user) async {
    await favoriteUsersCollection.doc(user.id.toString()).set(user.toMap());
  }

  Future<List<UserModel>> getFavoriteUsers() async {
    final snapshot = await favoriteUsersCollection.get();
    return snapshot.docs
        .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> removeFavoriteUser(int id) async {
    await favoriteUsersCollection.doc(id.toString()).delete();
  }
}
