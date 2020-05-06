import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/post/viewmodel/NewLyricViewModel.dart';
import 'package:solyric_app/app/ui/post/widget/ChordListWidget.dart';
import 'package:solyric_app/app/ui/post/widget/ChordTitleWidget.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class NewLyricScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return BaseWidget<NewLyricViewModel>(
      onModelReady: (controller, model) {
        model.redraw = () => controller.refreshState();
      },
      builder: (context, model, child) => Scaffold(
        appBar: UIHelper.commonAppBar(context),
        body: model.isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: deviceSize.height,
                width: deviceSize.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: SingleChildScrollView(
                            child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minHeight: deviceSize.height),
                                child: Container(
                                  color: Colors.black12,
                                  child: Card(
                                    margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Column(
                                        children: [
                                          ChordTitleWidget(model.title),
                                          ...model.lyricLines,
                                        ],
                                      ),
                                    ),
                                  ),
                                )))),
                    ChordList(lyricChords: model.lyricChords)
                  ],
                ),
              ),
      ),
    );
  }
}
