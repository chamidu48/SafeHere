import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  final String name;
  final String uid;
  final String bio;
  final String profilePic;
  final bool isOnline;
  final String phoneNumber;

  UserModel({
    required this.name,
    required this.uid,
    required this.bio,
    required this.profilePic,
    required this.isOnline,
    required this.phoneNumber
});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'bio':bio,
      'profilePic': profilePic,
      'isOnline': isOnline,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      uid: map['uid'] ?? '',
      bio: map['bio'] ?? '',
      profilePic: map['profilePic'] ?? '',
      isOnline: map['isOnline'] ?? false,
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }
}