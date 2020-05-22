import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/tutorial/viewmodel/TutorialViewModel.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<TutorialViewModel>(
      onModelReady: (controller, model) => model.controller = SwiperController(),
      builder: (context, model, child) => Stack(
        children: <Widget>[
          Swiper(
            itemBuilder: (context, index) => model.getItem(index),
            itemCount: 7,
            pagination: SwiperPagination(),
            controller: SwiperController(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 80,
              child: AppBar(
                bottomOpacity: 0.0,
                elevation: 0.0,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, RouteNames.WALL),
                      child: Text(Resources.SKIP),
                    ),
                  )
                ],
                backgroundColor: Colors.transparent,
                title: Image(
                    width: 80,
                    height: 80,
                    image: AssetImage(Resources.IC_LOGO)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
