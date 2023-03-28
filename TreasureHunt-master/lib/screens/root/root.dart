import 'package:U_of_G_Treasure_Hunt/screens/home/home.dart';
import 'package:U_of_G_Treasure_Hunt/screens/login/login.dart';
import 'package:U_of_G_Treasure_Hunt/screens/noGame/noGame.dart';
import 'package:U_of_G_Treasure_Hunt/screens/splashScreen/splashScreen.dart';
import 'package:U_of_G_Treasure_Hunt/states/currentUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../navBar/navBar.dart';

enum AuthStatus {
  unknown,
  notLoggedIn,
  notInGame,
  inGame,
}

class MyRoot extends StatefulWidget {
  const MyRoot({Key? key}) : super(key: key);

  @override
  State<MyRoot> createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  AuthStatus _authStatus = AuthStatus.unknown;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    //get the state, check current User, set Authstatus based on state
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStartUp();
    //if login works on start up check if they are already in a game or not
    if (_returnString == "Success"){
      if(_currentUser.getCurrentUser.gameId != null){
        setState(() {
          _authStatus = AuthStatus.inGame;
        });
      }else {
        setState(() {
          _authStatus = AuthStatus.notInGame;
        });
      }
      //otherwise, if login doesn't work, the user is not logged in
      //and we set the state to noLoggedIn state
    }else{
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.unknown:
        retVal = OurSplashScreen();
        break;
      case AuthStatus.notLoggedIn:
        retVal = MyLogin();
        break;
      case AuthStatus.notInGame:
        retVal = OurNoGame();
        break;
      case AuthStatus.inGame:
        retVal = OurNavBar();
        break;
    }
    return retVal;
  }
}
