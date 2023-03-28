import 'package:U_of_G_Treasure_Hunt/screens/noGame/noGame.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

import '../../services/database.dart';
import '../../states/currentUser.dart';
import '../../style.dart';
import '../root/root.dart';

class OurProfile extends StatefulWidget {
  const OurProfile({Key? key}) : super(key: key);

  @override
  State<OurProfile> createState() => _OurProfileState();
}

class _OurProfileState extends State<OurProfile> {
  List<List> leaderboardList = [];
  String? teamName;
  String? gameName;
  String? gameID;
  int? currentTreasure;
  bool infoRetrieved = false;

  void _signOut(BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.signOut();
    if (_returnString == "Success") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyRoot()),
        (route) => false,
      );
    }
  }

  void _leaveGame(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User _firebaseUser = await _auth.currentUser!;
    await OurDatabase().leaveGame(_firebaseUser.uid);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => OurNoGame()),
          (route) => false,
    );
  }

  @override
  void initState() {
    _getProfileInfo();
    super.initState();
  }

  Future<void> _handleRefresh() async {
    _getProfileInfo();
  }

  void _getProfileInfo() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User _firebaseUser = await _auth.currentUser!;

    teamName = await OurDatabase().getTeamName(_firebaseUser.uid);
    gameID = await OurDatabase().getUserGameID(_firebaseUser.uid);
    gameName = await OurDatabase().getGameName(gameID);
    currentTreasure = await OurDatabase().getUserTreasure(_firebaseUser.uid);

    setState(() => infoRetrieved = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TEAM PROFILE",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Center(
                        child: Text(
                      'Game Info',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontFamily: "Swiss-721-BT",
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 56, 101, 20),
                          shadows: <Shadow>[
                            Shadow(
                                color: Colors.white38,
                                blurRadius: 35,
                                offset: Offset(
                                  2.0,
                                  2.0,
                                ))
                          ]),
                    )),
                    content: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 100,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Name: " + '${gameName}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "Swiss-721-BT",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                          color: Colors.white38,
                                          blurRadius: 20,
                                          offset: Offset(
                                            2.0,
                                            2.0,
                                          ))
                                    ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Game ID: " + '${gameID}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Swiss-721-BT",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: <Shadow>[
                                      Shadow(
                                          color: Colors.white38,
                                          blurRadius: 10,
                                          offset: Offset(
                                            2.0,
                                            2.0,
                                          ))
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Center(
                        child: ElevatedButton(
                          child: Text('Got It!'),
                          style: ButtonStyle(),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: infoRetrieved == false
          ? const Center(
              child: Text(
              "loading...",
              style: TextStyle(color: Colors.white38),
            ))
          : LiquidPullToRefresh(
              onRefresh: _handleRefresh,
              color: Colors.white70,
              height: 150,
              animSpeedFactor: 7,
              showChildOpacityTransition: true,
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      width: 125,
                      height: 125,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white12,
                              blurRadius: 100,
                              offset: Offset(
                                2.0,
                                2.0,
                              ))
                        ],
                        border: Border.all(color: Colors.amber),
                        image: const DecorationImage(
                          image: AssetImage("assets/team_image.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${teamName}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 35.0,
                        fontFamily: "Swiss-721-BT",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                              color: Colors.white38,
                              blurRadius: 35,
                              offset: Offset(
                                2.0,
                                2.0,
                              ))
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 30),
                    child: Container(
                      width: 250,
                      height: 225,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white38, goldenText]),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            const Text(
                              "Your team has earned...",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Swiss-721-BT",
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${currentTreasure}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: goldenText,
                                      fontSize: 50),
                                ),
                                Image.asset(
                                  "assets/treasure.png",
                                  height: 100,
                                  width: 100,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          child: Text("Leave Game"),
                          onPressed: () => _leaveGame(context),
                        ),
                        ElevatedButton(
                          child: Text("Sign Out"),
                          onPressed: () => _signOut(context),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("TEAM PROFILE"),
      ),
      body: ListView(
        children: [
          Text("Team:"),
          Text("Current Game:"),
          Text("Game ID:"),
          Text("Team Treasure:"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Text("Leave Game"),
                  onPressed: () => _signOut(context),
                ),
                ElevatedButton(
                  child: Text("Sign Out"),
                  onPressed: () => _signOut(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
