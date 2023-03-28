import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/taskQuestions.dart';
import '../screens/challenges/cloistersChallenge/cloistersChallengeResultsPage.dart';
import '../screens/challenges/QMUChallenge/QMUChallengeResultsPage.dart';
import '../screens/challenges/stevensonChallenge/stevensonChallengeResultsPage.dart';

class StevensonChallengeController extends GetxController
    with GetSingleTickerProviderStateMixin {

  Animation? _animationVar;
  late final bool? KGCompletionstatus;
  final LatLng sourceLocation = LatLng(55.873543, -4.289058);
  Animation? get animationVar => _animationVar;
  final LatLng kelvinGroveChallengeLocation = LatLng(55.872886, -4.288518);
  AnimationController? theAnimationController;

  bool isTapped = false;

  double begin = 0.0;

  PageController? pageControllerVar;

  double end = 1.0;

  PageController? get thePageController => pageControllerVar;

  int totalTimeTaken = 0;

  int secondsVar = 30;
  @override
  void onInit() {
    super.onInit();
    theAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));
    //
    _animationVar = Tween(begin: begin, end: end).animate(theAnimationController!)
      ..addListener(() {
        update();
      });
    theAnimationController?.forward().whenComplete(goToNextTask);
    pageControllerVar = PageController();
  }

  final List<TaskQuestion>? tasksList = stevensonChallengeTaskData
      ?.map((task) => TaskQuestion(
    title: task['title'],
    question: task['question'],
    answer: task['answer_index'],
    choices: task['choices'],
  ))
      .toList();

  List<TaskQuestion>? get tasks => tasksList;

  RxInt taskNumberVar = 1.obs;
  RxInt get taskNumber => taskNumberVar;

  //add me back inside future.delayed
  void goToNextTask() {
    if (taskNumberVar.value == 5) {
      Get.to(OurStevensonChallengeResultsPage());
      /*Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
            const OurKGChallengeResultsPage()),
      );*/
    } else {
      pageControllerVar?.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
      answeredVar = false;
      theAnimationController?.reset();
      theAnimationController?.forward().whenComplete(goToNextTask);
    }
  }

  int? numberOfAnswersCorrectVar = 0;
  int? get numberOfAnswersCorrect => numberOfAnswersCorrectVar;

  int? userChoiceVar;
  int? get userChoice => userChoiceVar;

  int? answerIndexVar;
  int? get answerIndex => answerIndexVar;

  bool answeredVar = false;
  bool get answered => answeredVar;

  void updateTaskNumber(args) {
    taskNumberVar.value++;
  }

  void checkAnswer(int? chosenIndex, TaskQuestion task) {
    answerIndexVar = task.answer!;

    isTapped = true;

    if (chosenIndex == answerIndexVar) {
      numberOfAnswersCorrectVar = (numberOfAnswersCorrectVar! + 1);
    }
    answeredVar = true;
    userChoiceVar = chosenIndex;

    int timeTaken = (animationVar?.value * 30).round();
    totalTimeTaken = totalTimeTaken + timeTaken;

    theAnimationController?.stop();
    update();

    Future.delayed(Duration(seconds: 1), () {
      goToNextTask();
    });
  }

  void onClose() {
    super.onClose();
    theAnimationController?.dispose();
    pageControllerVar?.dispose();
  }
}
