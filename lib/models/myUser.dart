import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyUser {


  final String? uid;
  final String? email;
  final String? name;
  final String? gender;
  final String? interestedIn;
  final String? photo;
  final Timestamp? age;
  final GeoPoint? location;

  static const empty = MyUser(uid: "");

  bool get isEmpty => this == MyUser.empty;

  bool get isNotEmpty => this != MyUser.empty;

  const MyUser({@required this.uid,
    this.email,
    this.name,
    this.gender,
    this.interestedIn,
    this.photo,
    this.age,
    this.location});

  @override
  List<Object?> get props =>
      [uid, email, name, gender, interestedIn, photo, age, location];
}
