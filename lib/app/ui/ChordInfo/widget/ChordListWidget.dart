import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/ChordInfo/viewModel/ChordTabsViewModel.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';

class ChordListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BaseWidget<ChordTabsViewModel>(
        builder: (context, model, child) => Padding(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 12),
              itemCount: model.localChords.length,
              itemBuilder: (BuildContext context, int position) => Center(
                  child: GestureDetector(
                onTap: () {
                  model.listSelection = model.localChords[position];
                  model.scrollerSelection =
                      model.localChords[position].variations.first;
                },
                child: Text(
                  model.localChords[position].name,
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
      position == model.localChords.indexOf(model.listSelection)
          ? Theme.of(context).accentColor
          : Colors.white;
}
