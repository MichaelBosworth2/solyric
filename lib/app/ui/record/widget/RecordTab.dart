import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/record/widget/ListRecord.dart';
import 'package:solyric_app/app/ui/record/widget/RecordCard.dart';
import 'package:solyric_app/app/utils/Resources.dart';
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
                    instructionsDrafts(),
                    UIHelper.verticalSpace(10),
                    ListRecord()
                  ],
                )
              )
        )
      );
  }

  Widget instructionsDrafts(){
    return Center(child: 
      Container(
        color: Colors.black12,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(10),
        child: Text(
          Resources.RECORDING_DRAFT,
          style: TextStyle(color: Colors.black38),
        ),
      )
    );
  }
}
