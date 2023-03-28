import 'package:flutter/material.dart';
import '../../home/home.dart';
import 'stevensonChallenge.dart';

class OurStevensonChallengeWelcome extends StatelessWidget {
  const OurStevensonChallengeWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _goToStevensonChallenge(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StevensonChallenge(),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Stevenson Challenge"),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.asset("assets/logo.png"),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text("Welcome to the Stevenson Building Sports Challenge!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Swiss-721-BT",
                    fontSize: 30.0,
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset("assets/stevenson.png"),
                  SizedBox(height: 30,),
                  Text(
                    "The following questions are on the Stevenson Building and UofG sports related trivia"
                        ,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "When you are ready, tap the button below to begin the challenge, happy hunting!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              child: Text(
                "Begin Challenge",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _goToStevensonChallenge(context),
            ),
          ],
        )
    );
  }
}
