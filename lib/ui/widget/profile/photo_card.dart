import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';
import 'package:solyric_app/ui/widget/login/RaisedGradientButton.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({this.paddingStart, this.paddingTop});

  final double paddingTop;
  final double paddingStart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, left: paddingStart),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CircleAvatar(
                    radius: 90,
                    backgroundImage:
                        NetworkImage(Resources.profilePlaceHolder)),
              ),
              Card(
                margin: EdgeInsets.only(left: 72),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(Resources.icNav),
                ),
              )
            ],
          ),
          UIHelper.verticalSpace(15),
          RaisedGradientButton(
              width: 120,
              height: 40,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 6),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  Text(
                    Resources.following,
                    style: TextStyle(color: Colors.white70),
                  )
                ],
              ),
              gradient: LinearGradient(
                colors: <Color>[Colors.blueAccent, Colors.purpleAccent],
              ))
        ],
      ),
    );
  }
}
