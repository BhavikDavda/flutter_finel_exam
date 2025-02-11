class UserModel {
  int? id;
  String username;
  String email;
  String password;
  bool isFavorite;

  UserModel({this.id, required this.username, required this.email, required this.password, this.isFavorite = false});

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    username: json['username'],
    email: json['email'],
    password: json['password'],
    isFavorite: json['isFavorite'] == 1,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'username': username,
    'email': email,
    'password': password,
    'isFavorite': isFavorite ? 1 : 0,
  };
}
