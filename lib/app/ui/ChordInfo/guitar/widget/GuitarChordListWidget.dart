import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/ChordInfo/viewModel/ChordTabsViewModel.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';

class GuitarChordListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BaseWidget<ChordTabsViewModel>(
        builder: (context, model, child) => Padding(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 12),
              itemCount: model.localGuitarChords.length,
              itemBuilder: (BuildContext context, int position) => Center(
                  child: GestureDetector(
                onTap: () {
                  model.guitarListSelection = model.localGuitarChords[position];
                  model.guitarScrollerSelection =
                      model.localGuitarChords[position].variations.first;
                },
                child: Text(
                  model.localGuitarChords[position].name,
                  style: TextStyle(
                    fontSize: 18,
                    color: _getColor(context, model, position),
                  ),
                ),
              )),
            ),
          ));

  Color _getColor(
          BuildContext context, ChordTabsViewModel model, int position) =>
      position == model.localGuitarChords.indexOf(model.guitarListSelection)
          ? Theme.of(context).accentColor
          : Colors.white;
}
