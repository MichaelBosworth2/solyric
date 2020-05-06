import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/wall/widget/CenterBottomTab.dart';
import 'package:solyric_app/app/ui/wall/widget/WallCard.dart';
import 'package:solyric_app/app/ui/wall/widget/BottomTab.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: UIHelper.commonAppBar(context),
      builder: (context, model, child) => Scaffold(
          appBar: child,
          body: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, i) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: WallCard(),
                  )),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomTab(
                  title: Resources.EXPLORE,
                  asset: Resources.IC_EXPLORE,
                  onClick: null),
              BottomTab(
                  title: Resources.SEARCH,
                  asset: Resources.IC_SEARCH,
                  onClick: null),
              CenterBottomTab(onClick: null),
              BottomTab(
                  title: Resources.CHORDS,
                  asset: Resources.IC_CHORDS,
                  onClick: () => null),
              BottomTab(
                  title: Resources.ACCOUNT,
                  asset: Resources.IC_ACCOUNT,
                  onClick: () =>
                      Navigator.pushNamed(context, RouteNames.PROFILE)),
            ],
          )),
    );
  }
}
