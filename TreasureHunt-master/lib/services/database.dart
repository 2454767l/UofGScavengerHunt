import 'dart:math';

import 'package:U_of_G_Treasure_Hunt/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OurDatabase{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async{
    String returnValue = "error";

    try {
      await _firestore.collection("users").doc(user.uid).set({
        'teamName' : user.teamName,
        'email'    : user.email,
        'accountCreated' : Timestamp.now(),
        'treasure' : 0,
        'kGChallengeCompleted' : false,
      });
      returnValue = "Success";
    } catch (e) {
      print(e);
    }

    return returnValue;
  }

  //retrieve user data
  Future<OurUser> getUserInfo(String uid) async{
    OurUser returnValue = OurUser();
    try{
      //retrieve user data from the db associated with their uid
      DocumentSnapshot _docSnapShot = await _firestore.collection("users").doc(uid).get();
      returnValue.uid = uid;
      returnValue.email = _docSnapShot.get("email");
      returnValue.teamName = _docSnapShot.get("teamName");
      returnValue.accountCreated = _docSnapShot.get("accountCreated");
      returnValue.gameId = _docSnapShot.get("gameId");
      //check the addition of these last two fields are not causing an error
      returnValue.treasure = _docSnapShot.get("treasure");
      returnValue.qmuChallengeCompletionStatus = _docSnapShot.get("kGChallengeCompleted");
    }catch(e){
      print(e);
    }
    return returnValue;
  }

  Future<String> createGame(String gameName, String? userUid) async{
    String returnValue = "error";
    //changed list to list literal, check if this is an issue
    List<String> teams = <String>[];

    try {
      teams.add(userUid!);
      var rng = new Random();
      var temp = rng.nextInt(9999 - 1000) + 1000;
      String gameID = temp.toString();

      await _firestore.collection("games").doc(gameID).set({
        'name' : gameName,
        'teams' : teams,
        'gameCreated' : Timestamp.now(),
      });

      DocumentReference _docRef = _firestore.collection("games").doc(gameID);

      /*DocumentReference _docRef = await _firestore.collection("games").add({
        'name' : gameName,
        'teams' : teams,
        'gameCreated' : Timestamp.now(),
      });*/

      //add newly created gameid to user
      await _firestore.collection("users").doc(userUid).update({
        'gameId' : _docRef.id,
      });

      returnValue = "Success";
    } catch (e) {
      print(e);
    }

    return returnValue;
  }

  Future<String> joinGame(String gameId, String? userUid) async{
    String returnValue = "error";
    List<String> teams = <String>[];

    try {
      teams.add(userUid!);
      await _firestore.collection("games").doc(gameId).update({
        //if there is already a team with the same uid it will not be added again
        'teams' : FieldValue.arrayUnion(teams),
      });

      await _firestore.collection("users").doc(userUid).update({
        'gameId' : gameId,
      });
      returnValue = "Success";
    } catch (e) {
      print(e);
    }

    return returnValue;
  }

  Future<List<String>> getGameTeams(String? gameId) async{
    List<String> listOfTeams = <String>[];
    try{
      //retrieve the teams in the specified game from the db
      DocumentSnapshot _docSnapShot = await _firestore.collection("games").doc(gameId).get();
      listOfTeams = _docSnapShot.get("teams").cast<String>();
    }catch(e){
      print(e);
    }
    return listOfTeams;
  }

  Future<String?> getGameName(String? gameId) async{
    String? gameName;
    try{
      //retrieve the teams in the specified game from the db
      DocumentSnapshot _docSnapShot = await _firestore.collection("games").doc(gameId).get();
      gameName = _docSnapShot.get("name");
    }catch(e){
      print(e);
    }
    return gameName;
  }

  Future<String> leaveGame(String? userUid) async {
    String returnValue = "error";
    try {
      await _firestore.collection("users").doc(userUid).update({
        'gameId' : '',
      });
      returnValue = "Success";
    } catch (e) {
      print(e);
    }
    return returnValue;
  }

  //get user gameID
  Future<String?> getUserGameID(String? uid) async{
    String? gameId;
    try{
      //retrieve user data from the db associated with their uid
      DocumentSnapshot _docSnapShot = await _firestore.collection("users").doc(uid).get();
      gameId = _docSnapShot.get("gameId");
    }catch(e){
      print(e);
    }
    return gameId;
  }

  Future<String?> getTeamName(String? uid) async{
    String? teamName;
    try{
      //retrieve user data from the db associated with their uid
      DocumentSnapshot _docSnapShot = await _firestore.collection("users").doc(uid).get();
      teamName = _docSnapShot.get("teamName");
    }catch(e){
      print(e);
    }
    return teamName;
  }

  Future<int?> getUserTreasure(String? uid) async{
    int? treasure;
    try{
      //retrieve user data from the db associated with their uid
      DocumentSnapshot _docSnapShot = await _firestore.collection("users").doc(uid).get();
      treasure = _docSnapShot.get("treasure");
    }catch(e){
      print(e);
    }
    return treasure;
  }

  Future<String> updateTreasure(String? userUid, int treasure) async {
    String returnValue = "error";
    try {
      await _firestore.collection("users").doc(userUid).update({
        'treasure' : treasure,
      });
      returnValue = "Success";
    } catch (e) {
      print(e);
    }

    return returnValue;
  }

  Future<bool?> getQMUChallengeCompletionStatus(String? uid) async{
    bool? status;
    try{
      //retrieve user data from the db associated with their uid
      DocumentSnapshot _docSnapShot = await _firestore.collection("users").doc(uid).get();
      status = _docSnapShot.get("qmuChallengeCompletionStatus");
    }catch(e){
      print(e);
    }
    return status;
  }

  Future<String> updateQMUChallengeCompletionStatus(String? userUid) async {
    String returnValue = "error";
    try {
      await _firestore.collection("users").doc(userUid).update({
        'qmuChallengeCompletionStatus' : true,
      });
      returnValue = "Success";
    } catch (e) {
      print(e);
    }
    return returnValue;
  }

  Future<bool?> getCloistersChallengeCompletionStatus(String? uid) async{
    bool? status;
    try{
      //retrieve user data from the db associated with their uid
      DocumentSnapshot _docSnapShot = await _firestore.collection("users").doc(uid).get();
      status = _docSnapShot.get("cloistersChallengeCompletionStatus");
    }catch(e){
      print(e);
    }
    return status;
  }

  Future<String> updateCloistersChallengeCompletionStatus(String? userUid) async {
    String returnValue = "error";
    try {
      await _firestore.collection("users").doc(userUid).update({
        'cloistersChallengeCompletionStatus' : true,
      });
      returnValue = "Success";
    } catch (e) {
      print(e);
    }
    return returnValue;
  }

  Future<bool?> getStevensonChallengeCompletionStatus(String? uid) async{
    bool? status;
    try{
      //retrieve user data from the db associated with their uid
      DocumentSnapshot _docSnapShot = await _firestore.collection("users").doc(uid).get();
      status = _docSnapShot.get("stevensonChallengeCompletionStatus");
    }catch(e){
      print(e);
    }
    return status;
  }

  Future<String> updateStevensonChallengeCompletionStatus(String? userUid) async {
    String returnValue = "error";
    try {
      await _firestore.collection("users").doc(userUid).update({
        'stevensonChallengeCompletionStatus' : true,
      });
      returnValue = "Success";
    } catch (e) {
      print(e);
    }
    return returnValue;
  }



}