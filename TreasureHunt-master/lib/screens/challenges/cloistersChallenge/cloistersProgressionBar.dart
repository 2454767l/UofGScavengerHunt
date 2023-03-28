import 'package:U_of_G_Treasure_Hunt/controllers/QMUChallengeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/cloistersChallengeController.dart';
import '../../../utils/theme.dart';

class CloistersProgressionBar extends StatelessWidget {
  const CloistersProgressionBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int one;
    double inf = double.infinity;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 4),
        borderRadius: BorderRadius.circular(50),
      ),
      height: 35,
      width: inf,
      child: GetBuilder<CloistersChallengeController>(
          init: CloistersChallengeController(),
          builder: (controller) {
          return Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  width:  controller.animationVar?.value * constraints.maxWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    gradient: const LinearGradient(
                      colors: [Colors.green, Colors.greenAccent],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${(controller.animationVar?.value * 30).round()} Seconds"),
                        Image.asset(
                          "assets/stop_watch.png",
                        ),
                      ],
                    ),
                  ))
            ],
          );
        }
      ),
    );
  }
}