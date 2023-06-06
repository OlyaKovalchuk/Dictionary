class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.photoUrl,
  });

  String id;
  String name;
  String email;
  String? photoUrl;
}
