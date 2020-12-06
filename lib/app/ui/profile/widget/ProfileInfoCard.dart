import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/profile/viewmodel/ProfileViewModel.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard(
      {this.profileContainerMargin, this.profileContainerSize});

  final double profileContainerSize;
  final double profileContainerMargin;

  @override
  Widget build(BuildContext context) => BaseWidget<ProfileViewModel>(
        child: Padding(
          padding: EdgeInsets.only(left: profileContainerMargin * 0.75),
          child: Column(
            children: <Widget>[
              Text(
                "Amante de la musica y la programacion, explorando el disenio.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
        builder: (context, model, child) => Container(
          margin: EdgeInsets.only(left: profileContainerMargin),
          color: Theme.of(context).primaryColor,
          height: profileContainerSize,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SvgPicture.asset(Resources.IC_BOOK),
                      UIHelper.horizontalSpaceSmall,
                      SvgPicture.asset(Resources.IC_SETTINGS),
                    ]),
                Padding(
                  padding: EdgeInsets.only(
                      left: profileContainerMargin * 0.5, top: 10),
                  child: Text(
                    model.user,
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 40, color: Colors.white70),
                  ),
                ),
                UIHelper.verticalSpace(profileContainerSize * 0.10),
                child,
                UIHelper.verticalSpace(profileContainerSize * 0.25),
                Padding(
                  padding: EdgeInsets.only(left: profileContainerMargin * 0.5),
                  child: Row(
                    children: <Widget>[
                      getColumn(31, Resources.LYRICS),
                      UIHelper.horizontalSpace(20),
                      Container(
                        height: 45,
                        width: 2,
                        color: Colors.grey,
                      ),
                      UIHelper.horizontalSpace(10),
                      getColumn(153, Resources.FOLLOWERS),
                      UIHelper.horizontalSpace(10),
                      Container(
                        height: 45,
                        width: 2,
                        color: Colors.grey,
                      ),
                      UIHelper.horizontalSpace(10),
                      getColumn(456, Resources.FOLLOWING)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget getColumn(int number, String title) => Column(
        children: <Widget>[
          Text(
            number.toString(),
            style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          Text(title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white70, fontSize: 9))
        ],
      );
}
