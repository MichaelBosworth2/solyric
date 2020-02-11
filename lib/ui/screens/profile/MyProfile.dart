import 'package:flutter/material.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';
import 'package:solyric_app/ui/widget/profile/info_card.dart';
import 'package:solyric_app/ui/widget/profile/photo_card.dart';
import 'package:solyric_app/ui/widget/wall/wall_card.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    return Scaffold(
      appBar: UIHelper.solyricAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                InfoCard(
                  profileContainerSize: deviceSize.size.height * 0.55,
                  profileContainerMargin: deviceSize.size.width * 0.30,
                ),
                PhotoCard(
                  paddingStart: deviceSize.size.width * 0.08,
                  paddingTop: deviceSize.size.height * 0.142,
                )
              ],
            ),
            ListView.builder(
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: WallCard(),
                ))
          ],
        ),
      )
    );
  }
}
