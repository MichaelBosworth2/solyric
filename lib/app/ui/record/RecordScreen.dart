import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/record/widget/RecordTab.dart';
import 'package:solyric_app/app/ui/record/viewmodel/RecordAudioViewModel.dart';
import 'package:solyric_app/app/ui/record/widget/RecordCard.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class RecordScreen extends StatefulWidget {
  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<RecordAudioViewModel>(
      /*onModelReady: (controller, model) => model.controller = DefaultTabController(),*/
      builder: (context, model, child) => DefaultTabController(
        length: 2,
        child:
          Scaffold(
            appBar: AppBar(
                    automaticallyImplyLeading: true,
                    centerTitle: true,
                    title: UIHelper.actionBarLogo(Resources.IC_LOGO),
                    actions: UIHelper.actionBarActions(context),
                    bottom: TabBar(indicatorColor: Colors.white, tabs: [
                      Tab(text: Resources.RECORD_TITLE),
                      Tab(text: Resources.RECORD_TITLE_LYRICS)
                    ])),
            body: model.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : TabBarView(children: [
                        RecordTab(),
                        Center(child: Text('Lirycs')),
                      ])
            
          ),
      )
    );
  }
}
