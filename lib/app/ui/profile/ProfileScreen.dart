import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/profile/viewmodel/ProfileViewModel.dart';
import 'package:solyric_app/app/ui/profile/widget/ProfileInfoCard.dart';
import 'package:solyric_app/app/ui/profile/widget/ProfilePhotoCard.dart';
import 'package:solyric_app/app/ui/wall/widget/WallCard.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);

    return BaseWidget<ProfileViewModel>(
        onModelReady: (controller, model) {
          model.userName();
          model.getUserPosts();
        },
        builder: (context, model, child) => Scaffold(
              body: model.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                ProfileInfoCard(
                                  profileContainerSize:
                                      deviceSize.size.height * 0.55,
                                  profileContainerMargin:
                                      deviceSize.size.width * 0.30,
                                ),
                                ProfilePhotoCard(
                                  paddingStart: deviceSize.size.width * 0.08,
                                  paddingTop: deviceSize.size.height * 0.142,
                                )
                              ],
                            ),
                            ListView.builder(
                                itemCount: model.userPosts.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (ctx, i) => Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: WallCard(
                                        title: model.userPosts[i].title,
                                        description:
                                            model.userPosts[i].description,
                                        attachment:
                                            model.userPosts[i].attachment,
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    ),
            ));
  }
}
