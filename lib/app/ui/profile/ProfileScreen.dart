import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/profile/widget/ProfileInfoCard.dart';
import 'package:solyric_app/app/ui/profile/widget/ProfilePhotoCard.dart';
import 'package:solyric_app/app/ui/wall/widget/WallCard.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    return Scaffold(
      appBar: UIHelper.commonAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ProfileInfoCard(
                  profileContainerSize: deviceSize.size.height * 0.55,
                  profileContainerMargin: deviceSize.size.width * 0.30,
                ),
                ProfilePhotoCard(
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
