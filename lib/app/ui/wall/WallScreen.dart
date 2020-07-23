import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/wall/viewmodel/WallViewModel.dart';
import 'package:solyric_app/app/ui/wall/widget/WallCard.dart';

class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<WallViewModel>(
      builder: (context, model, child) => Scaffold(
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: WallCard(),
                )),
      ),
    );
  }
}
