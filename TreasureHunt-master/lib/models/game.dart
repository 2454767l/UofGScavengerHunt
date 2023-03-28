import 'package:cloud_firestore/cloud_firestore.dart';

class OurGame {
  String? id;
  String? name;
  List<String>? teams;
  Timestamp? gameCreated;

  OurGame({
    this.id,
    this.name,
    this.teams,
    this.gameCreated,
  });
}
