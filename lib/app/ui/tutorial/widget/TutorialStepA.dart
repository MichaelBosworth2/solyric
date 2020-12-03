import 'package:flutter/material.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class TutorialStepA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(Resources.BACKGROUND_A),
                    fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'HGH',
                  textAlign: TextAlign.center,
                  style: UIHelper.styleCover,
                ),
              ),
              UIHelper.verticalSpace(20),
              Image(
                image: AssetImage(Resources.IC_LOGO),
                width: 240,
                height: 160,
              ),
              UIHelper.verticalSpace(50),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  '',
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
