import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/app/utils/Resources.dart';

class CenterBottomTab extends StatelessWidget {

  final Function onClick;

  CenterBottomTab({this.onClick});

  @override
  Widget build(BuildContext context) =>
      GestureDetector(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 2.0,
                color: Colors.black.withOpacity(.5),
                offset: Offset(4.0, 5.0),
              ),
            ],
            color: Colors.white,
          ),
          margin: EdgeInsets.only(bottom: 8, top: 4),
          padding: EdgeInsets.all(10),
          child: SvgPicture.asset(
            Resources.IC_PLUS,
            width: 35,
            height: 35,
          ),
        ),
      );
}