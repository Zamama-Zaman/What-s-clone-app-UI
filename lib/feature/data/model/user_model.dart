import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_clone_app/feature/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    final String? name,
    final String? email,
    final String? phoneNumber,
    final bool? isOnline,
    final String? uid,
    final String? status,
    final String? profileUrl,
  }) : super(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          isOnline: isOnline,
          profileUrl: profileUrl,
          status: status,
          uid: uid,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot.get('name'),
      email: snapshot.get('email'),
      phoneNumber: snapshot.get('phoneNumber'),
      uid: snapshot.get('uid'),
      isOnline: snapshot.get('isOnline'),
      profileUrl: snapshot.get('profileUrl'),
      status: snapshot.get('status'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "uid": uid,
      "isOnline": isOnline,
      "profileUrl": profileUrl,
      "status": status,
    };
  }
}
