import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/wall/viewmodel/WallViewModel.dart';
import 'package:solyric_app/app/ui/wall/widget/BottomTab.dart';
import 'package:solyric_app/app/ui/wall/widget/CenterBottomTab.dart';
import 'package:solyric_app/app/ui/wall/widget/WallCard.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<WallViewModel>(
      child: UIHelper.commonAppBar(context, backStack: false),
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
            children: _buildBottomTabActions(context),
          )),
    );
  }

  /// Build bottom navigation actions
  /// @see [BottomTab] and [CenterBottomTab]
  List<Widget> _buildBottomTabActions(BuildContext context) => [
        BottomTab(
            title: Resources.EXPLORE,
            asset: Resources.IC_EXPLORE,
            onClick: () => Navigator.pushNamed(context, RouteNames.PROFILE)),
        BottomTab(
            title: Resources.SEARCH,
            asset: Resources.IC_SEARCH,
            onClick: () => Navigator.pushNamed(context, RouteNames.PROFILE)),
        CenterBottomTab(
            onClick: () => Navigator.pushNamed(context, RouteNames.PROFILE)),
        BottomTab(
            title: Resources.CHORDS,
            asset: Resources.IC_CHORDS,
            onClick: () => Navigator.pushNamed(context, RouteNames.PROFILE)),
        BottomTab(
            title: Resources.ACCOUNT,
            asset: Resources.IC_ACCOUNT,
            onClick: () => Navigator.pushNamed(context, RouteNames.PROFILE))
      ];
}
