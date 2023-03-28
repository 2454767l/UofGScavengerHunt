import 'package:U_of_G_Treasure_Hunt/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import '../models/user.dart';

class CurrentUser extends ChangeNotifier {
  OurUser _currentUser = OurUser();

  OurUser get getCurrentUser => _currentUser;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String returnValue = "error";
    try {
      User _firebaseUser = await _auth.currentUser!;
      if(_firebaseUser != null){
        _currentUser = await OurDatabase().getUserInfo(_firebaseUser.uid);
      if(_currentUser != null){
        returnValue = "Success";
      }}
      /*_currentUser.uid = _firebaseUser.uid;
      _currentUser.email = _firebaseUser.email!;
      returnValue = "Success";*/
    } catch (e) {
      print(e);
    }
    return returnValue;
  }

  Future<String> signOut() async {
    String returnValue = "error";
    try {
      await _auth.signOut();
      _currentUser = OurUser();
      returnValue = "Success";
    } catch (e) {
      print(e);
    }
    return returnValue;
  }

  Future<String> signUpUser(
      String email, String password, String teamName) async {
    String returnValue = "error";
    OurUser _user = OurUser();
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authResult.user?.uid;
      _user.email = _authResult.user?.email;
      _user.teamName = teamName;
      String _returnString = await OurDatabase().createUser(_user);
      if(_returnString == "Success"){
        returnValue = "Success";
      }
      /*if (_authResult.user != null) {
        returnValue = "Success";
      }*/
    } catch (e) {
      print(e);
    }
    return returnValue;
  }

  Future<String> loginUser(String email, String password) async {
    String returnValue = "error";

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      //what happens if you try to sign in with a user that doesn't exist in the db?
      _currentUser = await OurDatabase().getUserInfo(_authResult.user!.uid);
      if(_currentUser != null){
        returnValue = "Success";
      }
      /*final user = _authResult.user;
      if (user != null) {
        _currentUser.uid = user.uid;
        _currentUser.email = user.email!;
        returnValue = "Success";
      }*/
    } catch (e) {
      print(e);
    }
    return returnValue;
  }
}
