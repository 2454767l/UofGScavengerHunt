import 'package:flutter/material.dart';
import '../../home/home.dart';
import 'QMUChallenge.dart';

class OurKGChallenge1 extends StatelessWidget {
  const OurKGChallenge1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void _goToKGChallenge2(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OurKGChallenge2(),
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("QMU Challenge"),
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
              child: Text("Welcome to the QMU Challenge!",
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
                  Image.asset("assets/qmu.png"),
                  SizedBox(height: 30,),
                  Text(
                    "The following questions are a combination of both trivia and things to find within the cloisters. "
                        "(It is reccomended you begin this challenge outside the QMU)",
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
              onPressed: () => _goToKGChallenge2(context),
            ),
          ],
        )
    );
  }
}
