// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

class UserFromFireBaseModel {
  final String? name;
  final int? age;
  final String? hobby;

  UserFromFireBaseModel({this.name, this.age, this.hobby});

  factory UserFromFireBaseModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserFromFireBaseModel(
      name: data?['name'],
      age: data?['age'],
      hobby: data?['hobby'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (age != null) "age": age,
      if (hobby != null) "hobby": hobby
    };
  }
}
