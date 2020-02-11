import 'package:flutter/material.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';

class TutorialStepOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(Resources.tutorial1),
                    fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  Resources.tutorialWelcome,
                  textAlign: TextAlign.center,
                  style: UIHelper.styleCover,
                ),
              ),
              UIHelper.verticalSpace(20),
              Image(
                image: AssetImage(Resources.logo),
                width: 240,
                height: 160,
              ),
              UIHelper.verticalSpace(50),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  Resources.step1Instructions,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
