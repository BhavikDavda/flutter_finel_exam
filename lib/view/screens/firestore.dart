import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/usermodel.dart';


class FirebaseService {
  final CollectionReference favorites = FirebaseFirestore.instance.collection('favorites');

  Future<void> addFavorite(UserModel user) async {
    await favorites.doc(user.id.toString()).set(user.toMap());
  }

  Future<void> removeFavorite(int id) async {
    await favorites.doc(id.toString()).delete();
  }

  Stream<List<UserModel>> getFavorites() {
    return favorites.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>)).toList());
  }
}
