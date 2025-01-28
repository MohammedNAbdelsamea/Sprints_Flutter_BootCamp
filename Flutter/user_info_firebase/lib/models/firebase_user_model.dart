import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirebaseModel {
  final String? name;
  final int? age;
  final String? favouriteHobby;


  UserFirebaseModel({
    this.name,
    this.age,
    this.favouriteHobby,

  });

  factory UserFirebaseModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot
      ) {
    final data = snapshot.data();
    return UserFirebaseModel(
      name: data?['name'],
      age: data?['age'],
      favouriteHobby: data?['favouriteHobby'],

    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (age != null) "age": age,
      if (favouriteHobby != null) "favouriteHobby": favouriteHobby,

    };
  }
}