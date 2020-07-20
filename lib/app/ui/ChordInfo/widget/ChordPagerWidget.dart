import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:solyric_app/app/ui/ChordInfo/viewModel/ChordTabsViewModel.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';

import 'GuitarPagerItem.dart';

class ChordPagerWidget extends StatefulWidget {
  const ChordPagerWidget({Key key}) : super(key: key);

  @override
  _ChordPagerWidgetState createState() => _ChordPagerWidgetState();
}

class _ChordPagerWidgetState extends State<ChordPagerWidget> {
  @override
  Widget build(BuildContext context) => BaseWidget<ChordTabsViewModel>(
        builder: (context, model, child) => Swiper(
          itemBuilder: (context, index) => GuitarPagerItem(
              name: model.scrollerSelection.name,
              resource: model.scrollerSelection.positions[index]),
          itemCount: model.scrollerSelection.positions.length,
          pagination: SwiperPagination(),
          controller: SwiperController(),
        ),
      );
}
