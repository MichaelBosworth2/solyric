import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';

class BottomTab extends StatelessWidget {

  final Function onClick;
  final String title;
  final String asset;

  const BottomTab({this.title, this.asset, this.onClick});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onClick,
    child: Container(
      height: 50,
      child: Column(
        children: <Widget>[
          SvgPicture.asset(asset),
          UIHelper.verticalSpace(6),
          Text(
            title,
            style: TextStyle(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );

}