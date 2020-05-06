import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class WallInfoCard extends StatelessWidget {
  const WallInfoCard(this.deviceWidth);

  final deviceWidth;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Card(
          elevation: 8,
          child: Container(
            height: 325,
            width: deviceWidth - 138,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                const Text(
                  "Has World War 3 begun?",
                  style: UIHelper.cardTitle,
                  overflow: TextOverflow.ellipsis,
                ),
                UIHelper.verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: UIHelper.emptyText,
                      ),
                      Column(
                        children: <Widget>[
                          UIHelper.verticalSpaceLarge,
                          SvgPicture.asset(Resources.IC_NAV),
                          UIHelper.verticalSpaceLarge,
                          SvgPicture.asset(Resources.IC_MESSAGE),
                          Text(
                            "40",
                            style: TextStyle(fontSize: 8, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 30, top: 70),
                  child: Text(
                    Resources.PLACE_HOLDER_TEXT,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4, left: 30),
                  width: double.infinity,
                  child: const Text(
                    "54 minutes ago",
                    style: TextStyle(fontSize: 8, color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
