// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  final String userId;
  final String email;
  final String username;
  final String name;
  final String gender;
  final String dob;
  final String? profilePhotoUrl;
  final String createdAt;
  final String updatedAt;

  const UserDetails({
    required this.userId,
    required this.email,
    required this.username,
    required this.name,
    required this.gender,
    required this.dob,
    this.profilePhotoUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        userId,
        email,
        username,
        name,
        gender,
        dob,
        profilePhotoUrl,
      ];

  // TODO: need to take care of mapping as per DB collection structure.
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'username': username,
      'name': name,
      'gender': gender,
      'dob': dob,
      'profilePhotoUrl': profilePhotoUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      userId: map['userId'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      name: map['name'] as String,
      gender: map['gender'] as String,
      dob: map['dob'] as String,
      profilePhotoUrl: map['profilePhotoUrl'] != null ? map['profilePhotoUrl'] as String : null,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) => UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}
