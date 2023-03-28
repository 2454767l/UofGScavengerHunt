import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controllers/QMUChallengeController.dart';
import '../../../../models/taskQuestions.dart';
import '../../../../utils/theme.dart';
import '../../../controllers/cloistersChallengeController.dart';
import '../../../controllers/stevensonChallengeController.dart';
import 'stevensonChallengeOption.dart';

class StevensonChallengeCard extends StatelessWidget {
  const StevensonChallengeCard({
    required this.task,
    required this.isInUse,
    Key? key,
  }) : super(key: key);

  final bool isInUse;

  final TaskQuestion task;

  @override
  Widget build(BuildContext context) {
    StevensonChallengeController challengeController =
        Get.put(StevensonChallengeController());
    String nonNullableQuestion = task.question ?? 'default';

    return Container(
      margin: const EdgeInsets.only(
          bottom: standardPadding * 2.5,
          left: standardPadding / 2,
          right: standardPadding / 2),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(standardPadding),
      child: Column(
        children: [
          Text(
            nonNullableQuestion,
            style: const TextStyle(
              color: Color.fromRGBO(0, 56, 101, 20),
              fontFamily: "adobe-garamond-pro",
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: standardPadding/2),
          //challengeOption(),
          ...List.generate(
              4,
              (index) => StevensonChallengeOption(
                    index: index,
                    choice: task.choices[index],
                    tap: () {
                      challengeController.checkAnswer(index, task);
                    },
                  ))
        ],
      ),
    );
  }
}