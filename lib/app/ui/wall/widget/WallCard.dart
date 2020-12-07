import 'package:flutter/material.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';
import 'WallInfoCard.dart';
import 'WallMediaCard.dart';

class WallCard extends StatelessWidget {
  WallCard(
      {this.title = "Welcome",
      this.description = "Description Welcome",
      this.attachment = Resources.PROFILE_PLACE_HOLDER});

  String title;
  String description;
  String attachment;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
        height: 340,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    UIHelper.horizontalSpaceLarge,
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              NetworkImage(Resources.PROFILE_PLACE_HOLDER)),
                    ),
                    UIHelper.horizontalSpaceLarge,
                    WallInfoCard(
                      deviceWidth: deviceSize.width,
                      attachment: attachment,
                      description: description,
                      title: title,
                    )
                  ],
                )
              ],
            ),
            WallMediaCard(),
          ],
        ));
  }
}
