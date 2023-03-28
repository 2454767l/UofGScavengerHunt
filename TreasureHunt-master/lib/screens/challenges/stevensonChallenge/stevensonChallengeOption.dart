import 'package:U_of_G_Treasure_Hunt/controllers/QMUChallengeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controllers/cloistersChallengeController.dart';
import '../../../controllers/stevensonChallengeController.dart';
import '../../../utils/theme.dart';

class StevensonChallengeOption extends StatelessWidget {

  final VoidCallback? tap;

  final int? index;

  final List<String>? optionLetters = ['A', 'B', 'C', 'D'];

  final String? choice;

  StevensonChallengeOption({
    Key? key,
    this.tap,
    this.choice,
    optionLetters,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StevensonChallengeController>(
        init: StevensonChallengeController(),
        builder: (qnController) {
          Color returnColour() {
            if (!qnController.answered) {
              Color black = Color.fromRGBO(0, 56, 101, 20);
              return black;
            } else {
              if (qnController.answerIndex != qnController.userChoice &&
                  qnController.userChoice == index) {
                Color red = Colors.red;
                return red;
              } else if (qnController.answerIndex == index) {
                Color green = Colors.green;
                return green;
              }
            }
            return Color.fromRGBO(0, 56, 101, 20);
          }

          IconData returnIcon() {
            //Color white = Colors.black;
            return returnColour() == Colors.red ?
            Icons.close  : Icons.done;
          }

          return InkWell(
            onTap:
            tap,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1.3, color: returnColour()),
                    borderRadius: BorderRadius.circular(25)),
                padding: const EdgeInsets.all(standardPadding),
                margin: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${optionLetters![index!]}) $choice",
                      style: TextStyle(fontSize: 20, color: returnColour(),fontFamily: "Swiss-721-BT",
                        ),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: returnColour(), width: 1.5),
                        color:  Color.fromRGBO(0, 56, 101, 20) == returnColour()
                            ? Colors.transparent
                            : returnColour(),
                      ),
                      child: Color.fromRGBO(0, 56, 101, 20) == returnColour()
                          ? null
                          : Icon(size: 30, color: Colors.white, returnIcon()),
                    ),
                  ],
                )),
          );
        });
  }
}
