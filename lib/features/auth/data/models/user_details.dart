// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  final String? id;
  final String userId;
  final String email;
  final String username;
  final String name;
  final String gender;
  final String dob;
  final String? profilePhotoUrl;
  final File? profilePhoto;
  final String? createdAt;
  final String? updatedAt;

  const UserDetails({
    this.id,
    required this.userId,
    required this.email,
    required this.username,
    required this.name,
    required this.gender,
    required this.dob,
    this.profilePhotoUrl,
    this.profilePhoto,
    this.createdAt,
    this.updatedAt,
  });

  UserDetails.ceate({
    required this.userId,
    required this.email,
    required this.username,
    required this.name,
    required this.gender,
    required this.dob,
    required this.profilePhoto,
  }): id = null,
      profilePhotoUrl = null,
      createdAt = DateTime.now().toString(),
      updatedAt = DateTime.now().toString();

  @override
  List<Object?> get props => [
        id,
        userId,
        email,
        username,
        name,
        gender,
        dob,
        profilePhotoUrl,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
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
      id: map['id'] != null ? map['id'] as String : null,
      userId: map['userId'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      name: map['name'] as String,
      gender: map['gender'] as String,
      dob: map['dob'] as String,
      profilePhotoUrl: map['profilePhotoUrl'] != null
          ? map['profilePhotoUrl'] as String
          : null,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) =>
      UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  UserDetails copyWith({
    String? id,
    String? userId,
    String? email,
    String? username,
    String? name,
    String? gender,
    String? dob,
    String? profilePhotoUrl,
    String? createdAt,
    String? updatedAt,
  }) {
    return UserDetails(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      username: username ?? this.username,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
