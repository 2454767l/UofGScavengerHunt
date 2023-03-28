import 'package:flutter/material.dart';
import '../../home/home.dart';
import 'cloistersChallenge.dart';

class OurCloistersChallengeWelcome extends StatelessWidget {
  const OurCloistersChallengeWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _goToCloistersChallenge(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CloistersChallenge(),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Cloisters Challenge"),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.asset("assets/logo.png"),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text("Welcome to the Cloisters Challenge!",
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
                  Image.asset("assets/column.png"),
                  SizedBox(height: 30,),
                  Text(
                    "The following questions are a combination of both trivia and things to find within the cloisters. "
                        "(It is reccomended you begin this challenge under the cloisters)",
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
              onPressed: () => _goToCloistersChallenge(context),
            ),
          ],
        )
    );
  }
}
