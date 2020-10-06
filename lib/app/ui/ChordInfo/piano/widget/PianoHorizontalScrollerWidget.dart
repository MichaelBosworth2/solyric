import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/ChordInfo/viewModel/ChordTabsViewModel.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class PianoHorizontalScrollerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BaseWidget<ChordTabsViewModel>(
        builder: (context, model, child) => Row(children: [
          Expanded(flex: 1, child: _buildDirectionalArrow(Icons.chevron_left)),
          Expanded(
              flex: 8,
              child: ListView.separated(
                itemCount: model.pianoListSelection.variations.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                        onTap: () => model.pianoScrollerSelection =
                            model.pianoListSelection.variations[index],
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: _buildListItem(context, model, index))),
                scrollDirection: Axis.horizontal,
              )),
          Expanded(flex: 1, child: _buildDirectionalArrow(Icons.chevron_right))
        ]),
      );

  Widget _buildListItem(
      BuildContext context, ChordTabsViewModel model, int position) {
    final variation = model.pianoListSelection.variations[position];
    return Container(
      height: double.infinity,
      width: 140,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                height: variation == model.pianoScrollerSelection ? 1 : 0,
                color: Theme.of(context).accentColor),
            UIHelper.verticalSpace(20)
          ],
        ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(variation.positions.first),
              fit: BoxFit.contain)),
    );
  }

  Widget _buildDirectionalArrow(IconData icon) => Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Icon(icon, color: Colors.white, size: 40));
}
