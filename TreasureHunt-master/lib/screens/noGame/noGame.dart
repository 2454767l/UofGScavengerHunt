import 'package:U_of_G_Treasure_Hunt/screens/createGame/createGame.dart';
import 'package:U_of_G_Treasure_Hunt/screens/joinGame/joinGame.dart';
import 'package:U_of_G_Treasure_Hunt/screens/rules/rules.dart';
import 'package:U_of_G_Treasure_Hunt/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurNoGame extends StatelessWidget {
  const OurNoGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _goToJoin(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OurJoinGame(),
        ),
      );
    }

    void _goToCreate(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OurCreateGame(),
        ),
      );
    }

    void _goToInstructions(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OurRules(),
        ),
      );
    }

    return Scaffold(
        body: Column(
      children: <Widget>[
        SizedBox( height: 60,),
        Padding(
          padding: EdgeInsets.all(40.0),
          child: Image.asset("assets/logo.png"),
        ),
        SizedBox( height: 30,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Text("Welcome to the UofG Scavenger Hunt!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                fontFamily: "adobe-garamond-pro",
                color: Colors.white,
              )),
        ),
        SizedBox( height: 20,),
        const Padding(
          padding: EdgeInsets.all(40.0),
          child: Text(
            "Please read the rules if you have not already otherwise you can create or join a game using the buttons below, " +
                "good luck Hunting!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Swiss-721-BT",
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox( height: 30,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(125, 34, 57, 25),
            textStyle: TextStyle(color: Colors.white),
          ),
          onPressed: () => _goToInstructions(context),
          child: Text("Game Instructions"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0, 132, 61, 25),
                  textStyle: TextStyle(color: Colors.white),
                ),
                onPressed: () => _goToCreate(context),
                child: Text("Create Game"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0, 132, 61, 25),
                  textStyle: TextStyle(color: Colors.white),
                ),
                child: Text(
                  "Join Game",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => _goToJoin(context),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
