import 'package:flutter/material.dart';
import 'package:solyric_app/ui/shared/Resources.dart';

class TutorialStepSix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(Resources.tutorial6),
              fit: BoxFit.cover)),
    );
  }
}