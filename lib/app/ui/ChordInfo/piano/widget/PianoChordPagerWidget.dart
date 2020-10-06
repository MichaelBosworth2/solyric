import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:solyric_app/app/ui/ChordInfo/piano/widget/PianoPagerItem.dart';
import 'package:solyric_app/app/ui/ChordInfo/viewModel/ChordTabsViewModel.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';

class PianoChordPagerWidget extends StatefulWidget {
  const PianoChordPagerWidget({Key key}) : super(key: key);

  @override
  _PianoChordPagerWidgetState createState() => _PianoChordPagerWidgetState();
}

class _PianoChordPagerWidgetState extends State<PianoChordPagerWidget> {
  @override
  Widget build(BuildContext context) => BaseWidget<ChordTabsViewModel>(
    builder: (context, model, child) => Swiper(
      itemBuilder: (context, index) => PianoPagerItem(
          name: model.pianoScrollerSelection.name,
          resource: model.pianoScrollerSelection.positions[index]),
      itemCount: model.pianoScrollerSelection.positions.length,
      pagination: SwiperPagination(margin: EdgeInsets.symmetric(vertical: 10)),
      controller: SwiperController(),
    )
  );
}