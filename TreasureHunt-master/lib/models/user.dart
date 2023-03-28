import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';

class OurUser {
  String? uid;
  String? email;
  String? teamName;
  Timestamp? accountCreated;
  String? gameId;
  int? treasure;
  bool? qmuChallengeCompletionStatus;

  OurUser({
    this.uid,
    this.email,
    this.teamName,
    this.accountCreated,
    this.gameId,
    this.treasure,
    this.qmuChallengeCompletionStatus,
  });
}
