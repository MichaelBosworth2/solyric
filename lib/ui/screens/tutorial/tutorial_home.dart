import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/viewmodel/tutorial_viewmodel.dart';
import 'package:solyric_app/ui/widget/base_widget.dart';

class TutorialHome extends StatefulWidget {
  @override
  _TutorialHomeState createState() => _TutorialHomeState();
}

class _TutorialHomeState extends State<TutorialHome> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<TutorialViewModel>(
      model: TutorialViewModel(SwiperController()),
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
                      onTap: () => model.next(),
                      child: Text(Resources.skip),
                    ),
                  )
                ],
                backgroundColor: Colors.transparent,
                title: Image(
                    width: 80,
                    height: 80,
                    image: AssetImage(Resources.logo)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
