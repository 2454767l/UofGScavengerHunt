import 'package:U_of_G_Treasure_Hunt/controllers/QMUChallengeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/theme.dart';
import 'QMUProgressionBar.dart';
import 'QMUchallengeCard.dart';

class OurKGChallenge2 extends StatelessWidget {
  const OurKGChallenge2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final bool? KGCompletionstatus;
    KGChallengeController challengeController = Get.put(KGChallengeController());
    //
    return Scaffold(
        appBar: AppBar(
          title: const Text("QMU Challenge"),
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: standardPadding),
              child: Column(
                children: [
                  const SizedBox(height: standardPadding / 2),
                  const KGProgressionBar(),
                  const SizedBox(height: standardPadding / 2),
                  Obx(() => Text(
                    "Task ${challengeController.taskNumber}/5",
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
                      itemBuilder: (context, index) => challengeCard(
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
