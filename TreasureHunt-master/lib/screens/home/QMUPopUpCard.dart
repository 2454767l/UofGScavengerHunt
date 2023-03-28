import 'package:U_of_G_Treasure_Hunt/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/theme.dart';
import '../challenges/QMUChallenge/QMUChallengeWelcome.dart';

class QMUPopUpCard extends StatelessWidget {
  const QMUPopUpCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(3, 3),
              blurRadius: 100,
            ),
          ],
        ),
        height: 325,
        width: 300,
        duration: Duration(seconds: 1),
        curve: Curves.bounceInOut,
        child: Padding(
          padding: const EdgeInsets.all(standardPadding),
          child: Column(
            children: [
              Text(
                'Heads Up!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              Text(
                'You have entered the radius of the QMU Challenge...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text(
                  "Take me to the challenge!",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.push(
                  context,
                  // pass the context of the showDialog method
                  MaterialPageRoute(
                      builder: (context) =>
                      const OurKGChallenge1()),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}