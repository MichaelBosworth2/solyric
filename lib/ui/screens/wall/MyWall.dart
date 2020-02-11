import 'package:flutter/material.dart';
import 'package:solyric_app/core/constraints/app_constraints.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';
import 'package:solyric_app/ui/widget/base_widget.dart';
import 'package:solyric_app/ui/widget/wall/CenterBottomTab.dart';
import 'package:solyric_app/ui/widget/wall/bottom_tab.dart';
import 'package:solyric_app/ui/widget/wall/wall_card.dart';

class MyWall extends StatefulWidget {
  @override
  _MyWallState createState() => _MyWallState();
}

class _MyWallState extends State<MyWall> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: UIHelper.solyricAppBar(context),
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
                  title: Resources.explore,
                  asset: Resources.icExplore,
                  onClick: null),
              BottomTab(
                  title: Resources.search,
                  asset: Resources.icSearch,
                  onClick: null),
              CenterBottomTab(onClick: null),
              BottomTab(
                  title: Resources.chords,
                  asset: Resources.icChords,
                  onClick: () => null),
              BottomTab(
                  title: Resources.account,
                  asset: Resources.icAccount,
                  onClick: () =>
                      Navigator.pushNamed(context, Routes.myProfile)),
            ],
          )),
    );
  }
}
