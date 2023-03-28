import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurRules extends StatelessWidget {
  const OurRules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GAME INSTRUCTIONS"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                child: Image.asset("assets/logo.png"),
              ),
              Text(
                "The researcher has developed a location based scavenger hunt unique to the University of Glasgow campus. Students compete against each other in teams to see which team can finish the game with the most virtual treasure. ",
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
              SizedBox(
                height: 10,
              ),
              Text(
                "Treasure is obtained by traveling within radius of each landmarks displayed on the map finding key points of interest and answering trivia questions related to that location area as well as the history and achievements of the University. More treasure will be awarded to teams who answer the questions with accuracy and speed. Teams can then see how they rank on the real-time in-game leader board.",
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
            ],
          ),
        ),
      ),
    );
  }
}
