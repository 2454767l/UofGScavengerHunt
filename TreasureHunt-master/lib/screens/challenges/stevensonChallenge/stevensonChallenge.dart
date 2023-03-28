import 'package:U_of_G_Treasure_Hunt/controllers/QMUChallengeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/cloistersChallengeController.dart';
import '../../../controllers/stevensonChallengeController.dart';
import '../../../utils/theme.dart';
import 'stevensonChallengeCard.dart';
import 'stevensonProgressionBar.dart';

class StevensonChallenge extends StatelessWidget {
  const StevensonChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final bool? KGCompletionstatus;
    StevensonChallengeController challengeController = Get.put(StevensonChallengeController());
    //
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stevenson Challenge"),
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: standardPadding),
              child: Column(
                children: [
                  const SizedBox(height: standardPadding / 2),
                  const StevensonProgressionBar(),
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
                      itemBuilder: (context, index) => StevensonChallengeCard(
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
