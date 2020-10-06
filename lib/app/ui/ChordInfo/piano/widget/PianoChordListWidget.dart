import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/ChordInfo/viewModel/ChordTabsViewModel.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';

class PianoChordListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BaseWidget<ChordTabsViewModel>(
      builder: (context, model, child) => ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: model.localPianoChords.length,
            itemBuilder: (BuildContext context, int position) => Center(
                child: GestureDetector(
              onTap: () {
                model.pianoListSelection = model.localPianoChords[position];
                model.pianoScrollerSelection =
                    model.localPianoChords[position].variations.first;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  model.localPianoChords[position].name,
                  style: TextStyle(
                    fontSize: 18,
                    color: _getColor(context, model, position),
                  ),
                ),
              ),
            )),
            scrollDirection: Axis.horizontal,
          ));

  Color _getColor(
          BuildContext context, ChordTabsViewModel model, int position) =>
      position == model.localPianoChords.indexOf(model.pianoListSelection)
          ? Theme.of(context).accentColor
          : Colors.white;
}
