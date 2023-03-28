import 'package:U_of_G_Treasure_Hunt/controllers/QMUChallengeController.dart';
import 'package:U_of_G_Treasure_Hunt/main.dart';
import 'package:U_of_G_Treasure_Hunt/screens/navBar/navBar.dart';
import 'package:U_of_G_Treasure_Hunt/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../controllers/cloistersChallengeController.dart';
import '../../../states/currentUser.dart';
import '../../../style.dart';
import '../../../utils/theme.dart';
import '../../home/home.dart';
import '../../root/root.dart';

class OurCloistersChallengeResultsPage extends StatelessWidget {
  const OurCloistersChallengeResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CloistersChallengeController _qnController = Get.put(CloistersChallengeController());

    //calculate the treasure obtained from the challenge
    int totalTimeTaken = _qnController.totalTimeTaken;
    int timeMulti = 300 - totalTimeTaken;
    int newlyObtainedTreasure =
        _qnController.numberOfAnswersCorrect! * timeMulti;

    void _updateTreasureAndGoHome(BuildContext context) async {
      FirebaseAuth _auth = FirebaseAuth.instance;
      User _firebaseUser = await _auth.currentUser!;

      //get the users current treasure
      int? currentTreasure =
      await OurDatabase().getUserTreasure(_firebaseUser.uid);

      //add the newly obtained treasure
      int newTreasure = currentTreasure! + newlyObtainedTreasure;

      //update the users treasure
      await OurDatabase().updateTreasure(_firebaseUser.uid, newTreasure);

      //update the users CloistersComletionStatus
      await OurDatabase().updateCloistersChallengeCompletionStatus(_firebaseUser.uid);

      //return home
      //Get.to(() => OurNavBar());
      Get.to(() => MyApp0());
    }

    return Theme(
      data: newTheme().buildTheme(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cloisters Challenge"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: [
              //const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.all(standardPadding/2),
                child: Text(
                  "Congratulations!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: goldenText,
                      fontSize: 40),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(standardPadding / 2),
                child: Text(
                  "You Have Completed the Cloisters Challenge",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: goldenText,
                      fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 25,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(standardPadding),
                child: Column(
                  children: [
                    Text(
                      "You Scored: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      "${_qnController.numberOfAnswersCorrect}/5",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: goldenText,
                          fontSize: 50),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 25,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(standardPadding),
                child: Column(
                  children: [
                    Text(
                      "Time Taken: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(height: standardBoxSize * 1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${totalTimeTaken} s",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: goldenText,
                              fontSize: 50),
                        ),
                      ],
                    )

                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 25,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(standardPadding),
                child: Column(
                  children: [
                    Text(
                      "You Earned: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(height: standardBoxSize * 1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${newlyObtainedTreasure}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: goldenText,
                              fontSize: 50),
                        ),
                        Image.asset(
                          "assets/treasure.png",
                          height: 50,
                          width: 50,
                        ),
                      ],
                    )

                  ],
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  child: Text('Back to Home'),
                  onPressed: () => _updateTreasureAndGoHome(context)),
            ],
          ),
        ),
      ),
    );
  }
}
