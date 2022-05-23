// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final bool? isOnline;
  final String? uid;
  final String? status;
  final String? profileUrl;

  UserEntity({
    this.name,
    this.email,
    this.phoneNumber,
    this.isOnline,
    this.uid,
    this.status = "Hello there I'm using this app",
    this.profileUrl,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        phoneNumber,
        isOnline,
        uid,
        status,
        profileUrl,
      ];
}
