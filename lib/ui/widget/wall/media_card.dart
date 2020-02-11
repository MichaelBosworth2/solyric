import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';

class MediaCard extends StatelessWidget {
  const MediaCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 90, right: 8, top: 60, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
              elevation: 8,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        colorFilter:
                            ColorFilter.mode(Colors.black54, BlendMode.darken),
                        image: NetworkImage(Resources.backgroundPlaceHolder))),
                width: 220,
                height: 150,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Rock",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "0:23",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 11),
                              textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: SvgPicture.asset(
                        Resources.icLines,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ],
                ),
              )),
          UIHelper.verticalSpaceSmall,
          Card(
            elevation: 8,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    Resources.icHeart,
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    "32",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
