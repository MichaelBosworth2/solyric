import 'package:flutter/material.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';
import 'package:solyric_app/ui/widget/wall/info_card.dart';
import 'package:solyric_app/ui/widget/wall/media_card.dart';

class WallCard extends StatelessWidget {
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
                              NetworkImage(Resources.profilePlaceHolder)),
                    ),
                    UIHelper.horizontalSpaceLarge,
                    InfoCard(deviceSize.width)
                  ],
                )
              ],
            ),
            const MediaCard(),
          ],
        ));
  }
}
