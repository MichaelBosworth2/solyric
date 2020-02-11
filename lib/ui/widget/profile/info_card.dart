import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({this.profileContainerMargin, this.profileContainerSize});

  final double profileContainerSize;
  final double profileContainerMargin;

  @override
  Widget build(BuildContext context) => Container(
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
                    SvgPicture.asset(Resources.icBook),
                    UIHelper.horizontalSpaceSmall,
                    SvgPicture.asset(Resources.icSettings),
                  ]),
              Padding(
                padding: EdgeInsets.only(
                    left: profileContainerMargin * 0.5, top: 10),
                child: Text(
                  "Susana Horia",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 40, color: Colors.white70),
                ),
              ),
              UIHelper.verticalSpace(profileContainerSize * 0.10),
              Padding(
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
              UIHelper.verticalSpace(profileContainerSize * 0.25),
              Padding(
                padding: EdgeInsets.only(left: profileContainerMargin * 0.5),
                child: Row(
                  children: <Widget>[
                    getColumn(31, Resources.lyrics),
                    UIHelper.horizontalSpace(20),
                    Container(
                      height: 45,
                      width: 2,
                      color: Colors.grey,
                    ),
                    UIHelper.horizontalSpace(10),
                    getColumn(153, Resources.followers),
                    UIHelper.horizontalSpace(10),
                    Container(
                      height: 45,
                      width: 2,
                      color: Colors.grey,
                    ),
                    UIHelper.horizontalSpace(10),
                    getColumn(456, Resources.following)
                  ],
                ),
              )
            ],
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
