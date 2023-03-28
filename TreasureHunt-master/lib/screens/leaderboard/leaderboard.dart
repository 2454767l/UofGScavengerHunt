import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../services/database.dart';
import '../../style.dart';

class MyLeaderboard extends StatefulWidget {
  const MyLeaderboard({Key? key}) : super(key: key);

  @override
  State<MyLeaderboard> createState() => _MyLeaderboardState();
}

class _MyLeaderboardState extends State<MyLeaderboard> {
  List<List> leaderboardList = [];

  //final _firestore = Firestore.instance;
  //List<LeaderboardPlayer> _players = [];
  void getLeaderBoardRankings() async {
    //retrieve game members from the db and sort them on device
    FirebaseAuth _auth = FirebaseAuth.instance;
    User _firebaseUser = await _auth.currentUser!;

    List<String?> listOfTeams = <String?>[];

    //retrieve gameId of the game the currentUser is in
    String? currentGameId =
        await OurDatabase().getUserGameID(_firebaseUser.uid);

    //retrieve the uids of the teams in the users current game.
    listOfTeams = await OurDatabase().getGameTeams(currentGameId!);

    List<List> leaderboardListTemp = [];
    for (int i = 0; i < (listOfTeams.length); i++) {
      //retrieve the user in the lists treasure
      String? teamName = await OurDatabase().getTeamName(listOfTeams[i]);
      int? treasure = await OurDatabase().getUserTreasure(listOfTeams[i]);
      treasure ??= 0;
      leaderboardListTemp.add([teamName, treasure]);
    }

    //sort list according to treasure count.
    leaderboardListTemp.sort((a, b) => b[1].compareTo(a[1]));

    if (this.mounted) {
      setState(() => leaderboardList = leaderboardListTemp);
    }
  }

  @override
  void initState() {
    getLeaderBoardRankings();
    super.initState();
  }

  Future<void> _handleRefresh() async{
    getLeaderBoardRankings();
  }

  @override
  Widget build(BuildContext context) {
    //var winner = leaderboardList[0][0].toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("LEADERBOARD"),
      ),
      body: leaderboardList.isEmpty
          ? const Center(child: Text("loading...", style: TextStyle(color: Colors.white38),))
          : LiquidPullToRefresh(
            onRefresh: _handleRefresh,
            color: Colors.white,
            height: 200,
            animSpeedFactor: 7,
            showChildOpacityTransition: true,
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      itemCount: leaderboardList.length,
                      itemBuilder: (BuildContext context, int index) {
                        //var player = players[index];
                        index++;
                        int listIndex = index - 1;
                        return Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Row(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${index}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: goldenText,
                                      fontSize: 50),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                const CurrentWinner(),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 45,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(125, 34, 57, 100),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                                leaderboardList[listIndex][0]
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: goldenText,
                                                    fontSize: 20)),
                                          ),
                                        index == 1
                                            ? Image.asset(
                                                "assets/gold_medal.png",
                                                height: 50,
                                                width: 50,
                                              )
                                            : (index == 2
                                                ? Image.asset(
                                                    "assets/silver_medal.png",
                                                    height: 50,
                                                    width: 50,
                                                  )
                                                : (index == 3
                                                    ? Image.asset(
                                                        "assets/bronze_medal.png",
                                                        height: 50,
                                                        width: 50,
                                                      )
                                                    : Container())),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 45,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(125, 34, 57, 100),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment(),
                                        children: [
                                          Text(
                                              leaderboardList[listIndex][1]
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: goldenText,
                                                  fontSize: 20)),
                                          Image.asset(
                                            "assets/treasure.png",
                                            height: 50,
                                            width: 50,
                                          ),
                                        ],
                                      )),
                                ),
                                const Divider(thickness: 10),
                              ]),
                        );

                        /*ListTile(
                    leading: Text('${index}'),
                    title: Text("${leaderboardList[listIndex][0].toString()}"),
                    //subtitle: Text('${leaderboardList[index][1]}'),
                  );*/
                      },
                    ),
                  ),

                  /*Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black,
                width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: goldenText,
                            fontSize: 20)),
                    Text("Team Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: goldenText,
                            fontSize: 20)),
                    Text("Treasure",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: goldenText,
                            fontSize: 20)),
                  ],
                ),
              ),
            ),*/
                ]),
              ),
          ),
    );
  }
}

class CurrentWinner extends StatelessWidget {
  const CurrentWinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /*Center(
          child: Image.asset(
            "assets/crown.png",
            height: 50,
            width: 50,
          ),
        ),*/
        Center(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.amber),
              image: const DecorationImage(
                image: AssetImage("assets/team_image.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),

        //Image.asset("assets/team_image.png", height: 50, width: 50,),
      ],
    );
  }
}
