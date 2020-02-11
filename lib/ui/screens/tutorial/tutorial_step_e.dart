import 'package:flutter/material.dart';
import 'package:solyric_app/ui/shared/Resources.dart';

class TutorialStepFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(Resources.tutorial5), fit: BoxFit.cover)),
    );
  }
}
