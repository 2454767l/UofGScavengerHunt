import 'package:U_of_G_Treasure_Hunt/controllers/QMUChallengeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/cloistersChallengeController.dart';
import '../../../utils/theme.dart';
import 'cloistersChallengeCard.dart';
import 'cloistersProgressionBar.dart';

class CloistersChallenge extends StatelessWidget {
  const CloistersChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final bool? KGCompletionstatus;
    CloistersChallengeController challengeController = Get.put(CloistersChallengeController());
    //
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cloisters Challenge"),
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: standardPadding),
              child: Column(
                children: [
                  const SizedBox(height: standardPadding / 2),
                  const CloistersProgressionBar(),
                  const SizedBox(height: standardPadding / 2),
                  Obx(() => Text(
                    "Question ${challengeController.taskNumber}/5",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Swiss-721-BT",
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),),
                  const Divider(thickness: 2),
                  const SizedBox(height: standardPadding / 2),
                  Expanded(
                    child: PageView.builder(
                      itemCount: 5,
                      onPageChanged: challengeController.updateTaskNumber,
                      controller : challengeController.thePageController,
                      itemBuilder: (context, index) => CloistersChallengeCard(
                        task: challengeController.tasks![index],
                        isInUse: true,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
