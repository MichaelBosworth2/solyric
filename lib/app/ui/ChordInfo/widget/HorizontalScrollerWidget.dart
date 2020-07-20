import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/ChordInfo/viewModel/ChordTabsViewModel.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';

class HorizontalScrollerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BaseWidget<ChordTabsViewModel>(
        builder: (context, model, child) => Row(children: [
          Expanded(flex: 1, child: _buildDirectionalArrow(Icons.chevron_left)),
          Expanded(
              flex: 8,
              child: ListView.separated(
                itemCount: model.listSelection.variations.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(height: 16),
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                        onTap: () => model.scrollerSelection = model.listSelection.variations[index],
                        child: _buildListItem(model.listSelection.variations[index].positions.first)),
                scrollDirection: Axis.horizontal,
              )),
          Expanded(flex: 1, child: _buildDirectionalArrow(Icons.chevron_right))
        ]),
      );

  Widget _buildListItem(String resource) => Container(
        width: 80,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(resource), fit: BoxFit.contain)),
      );

  Widget _buildDirectionalArrow(IconData icon) => Icon(
        icon,
        color: Colors.white,
        size: 40,
      );
}
