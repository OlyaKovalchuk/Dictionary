import 'package:dictionary/utils/extensions/map_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDTO {
  UserDTO({
    required this.id,
    required this.email,
    required this.name,
    this.photoUrl,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      photoUrl: json['photoUrl'],
    );
  }

  factory UserDTO.fromFirebaseUser(User user) {
    return UserDTO(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      photoUrl: user.photoURL,
    );
  }

  String id;
  String name;
  String email;
  String? photoUrl;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    data.clearAllNull();

    return data;
  }
}
