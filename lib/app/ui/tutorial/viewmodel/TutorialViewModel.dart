import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:solyric_app/app/ui/base/BaseViewModel.dart';
import 'package:solyric_app/app/ui/tutorial/widget/TutorialStepA.dart';
import 'package:solyric_app/app/ui/tutorial/widget/TutorialStepB.dart';
import 'package:solyric_app/app/ui/tutorial/widget/TutorialStepC.dart';
import 'package:solyric_app/app/ui/tutorial/widget/TutorialStepD.dart';
import 'package:solyric_app/app/ui/tutorial/widget/TutorialStepE.dart';
import 'package:solyric_app/app/ui/tutorial/widget/TutorialStepF.dart';
import 'package:solyric_app/app/ui/tutorial/widget/TutorialStepG.dart';
import 'package:solyric_app/domain/interaction/GetTutorialDataUseCase.dart';

class TutorialViewModel extends BaseViewModel {
  TutorialViewModel({@required GetTutorialDataUseCase useCase})
  : _useCase = useCase;

  final GetTutorialDataUseCase _useCase;
  SwiperController controller;
  

  final _tutorialSteps = [
    TutorialStepA(),
    TutorialStepB(),
    TutorialStepC(),
    TutorialStepD(),
    TutorialStepE(),
    TutorialStepF(),
    TutorialStepG()
  ];

  Widget getItem(int index) => _tutorialSteps[index];

  void next() => controller.next(animation: true);
}
