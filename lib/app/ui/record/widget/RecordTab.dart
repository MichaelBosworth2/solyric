import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/record/widget/ListRecord.dart';
import 'package:solyric_app/app/ui/record/widget/RecordCard.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class RecordTab extends StatefulWidget {
  @override
  _RecordTabState createState() => _RecordTabState();
}

class _RecordTabState extends State<RecordTab> {
    Widget build(BuildContext context) {
      final deviceSize = MediaQuery.of(context).size;

      return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: deviceSize.height),
            child: Container(
              color: Colors.grey.shade200,
              child:                      
                Column(
                  children: <Widget>[
                    RecordCard(),
                    UIHelper.verticalSpace(10),
                    ListRecord()
                  ],
                )
              )
        )
      );
  }
}
