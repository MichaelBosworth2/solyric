import 'package:flutter/cupertino.dart';
import 'package:solyric_app/ui/screens/tutorial/tutorial_step_a.dart';
import 'package:solyric_app/ui/screens/tutorial/tutorial_step_b.dart';
import 'package:solyric_app/ui/screens/tutorial/tutorial_step_c.dart';
import 'package:solyric_app/ui/screens/tutorial/tutorial_step_d.dart';
import 'package:solyric_app/ui/screens/tutorial/tutorial_step_e.dart';
import 'package:solyric_app/ui/screens/tutorial/tutorial_step_f.dart';
import 'package:solyric_app/ui/screens/tutorial/tutorial_step_g.dart';
import 'package:solyric_app/ui/viewmodel/base_viewmodel.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TutorialViewModel extends BaseViewModel {
  final SwiperController _controller;

  TutorialViewModel(this._controller);

  final _tutorialSteps = [
    TutorialStepOne(),
    TutorialStepTwo(),
    TutorialStepThree(),
    TutorialStepFour(),
    TutorialStepFive(),
    TutorialStepSix(),
    TutorialStepSeven()
  ];

  Widget getItem(int index) => _tutorialSteps[index];

  void next() => _controller.next(animation: true);
}
