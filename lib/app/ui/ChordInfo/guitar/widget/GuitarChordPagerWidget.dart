import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:solyric_app/app/ui/ChordInfo/viewModel/ChordTabsViewModel.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';

import 'GuitarPagerItem.dart';

class GuitarChordPagerWidget extends StatefulWidget {
  const GuitarChordPagerWidget({Key key}) : super(key: key);

  @override
  _GuitarChordPagerWidgetState createState() => _GuitarChordPagerWidgetState();
}

class _GuitarChordPagerWidgetState extends State<GuitarChordPagerWidget> {
  @override
  Widget build(BuildContext context) => BaseWidget<ChordTabsViewModel>(
        builder: (context, model, child) => Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Swiper(
            itemBuilder: (context, index) => GuitarPagerItem(
                name: model.guitarScrollerSelection.name,
                resource: model.guitarScrollerSelection.positions[index]),
            itemCount: model.guitarScrollerSelection.positions.length,
            pagination: SwiperPagination(margin: EdgeInsets.symmetric(vertical: 10)),
            controller: SwiperController(),
          ),
        ),
      );
}
