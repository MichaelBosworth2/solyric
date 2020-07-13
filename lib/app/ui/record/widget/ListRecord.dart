import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';
import 'package:solyric_app/app/ui/record/viewmodel/RecordAudioViewModel.dart';
import 'package:provider/provider.dart';
import 'package:solyric_app/domain/model/RecordAudio.dart';
import 'package:intl/intl.dart';

class ListRecord extends StatelessWidget {
  Widget lastAudio(context, recordAudio){
    if( recordAudio.audios.length > 0){
      return itemAudio(context,  recordAudio.audios.length - 1 , recordAudio);
    }else{
      return Container();
    }  
  }

  Widget notAudios(){
    return Container(
      width: double.infinity,
      height: 150,
      child:
        Center(
          child: Text(Resources.YOU_NOT_SAVED_RECORD, 
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              )
            )
        )
    );
  }

  Widget itemAudio(context, int index, RecordAudioViewModel recordAudioModel){
    int indexItemStandard = index + 1;
    RecordAudio recording = recordAudioModel.audios[index];
    
    final formatTime = new DateFormat.yMMMd().format(new DateTime.now());

    // The record is equal that recording select by user this  is allow while there is no recording in progress.   
    bool isCurrentSelected = !recordAudioModel.isRecording && recordAudioModel.currentAudio == recording;
    return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          decoration: BoxDecoration(
            color:isCurrentSelected ? Colors.black12 : Colors.transparent,
            borderRadius: isCurrentSelected ? BorderRadius.circular(10) : null,
            border: isCurrentSelected ? Border.all(
                color: Colors.black12,
                width: 1.0
            ) : null
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: 
              <Widget>[               
                Flexible(
                  flex: 3, 
                  child: 
                    InkWell(
                      onTap: (){
                        // Avoid select a audio when is new recording  audio in progress.
                        if(!recordAudioModel.isRecording){
                          recordAudioModel.selectAudioForListen(recording);
                        }                        
                      },
                      child: 
                          Text(indexItemStandard.toString(), 
                                    style: 
                                      TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13
                                      ), 
                                    textAlign: TextAlign.center                  
                                  )
                        )
                  ),
                  Flexible(
                   flex: 12, 
                    child:
                      InkWell(
                        onTap: (){
                          // Avoid select a audio when is new recording  audio in progress.
                          if(!recordAudioModel.isRecording){
                            recordAudioModel.selectAudioForListen(recording);
                          } 
                        },
                      child:
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[                                  
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                  Text(recording.name,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor, 
                                        fontSize: 16, 
                                        height: 1.1,
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                    Text(formatTime.toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.black38, 
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                ]),
                              ),
                            
                        ])
                    )
                  ),
                  Flexible(
                    flex: 3,
                    child:                             
                    Row(children: <Widget>[
                        recording.typeRecording == 'guitar' 
                        ? SvgPicture.asset(Resources.IC_GUITAR, color: Colors.black54)
                        : SvgPicture.asset(Resources.IC_PIANO, color: Colors.black54),
                        UIHelper.horizontalSpace(15),
                          InkWell(
                            child: SvgPicture.asset(Resources.IC_TRASH, color: Colors.black54),
                            onTap: () {
                                recordAudioModel.stopPlayer();
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  elevation: 20,
                                  builder: (context)=> Container(
                                      height: 200,
                                      margin: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                                              child: const Text(Resources.CONFIRM_DELETE_RECORD, 
                                                style: TextStyle(color: Colors.black87, fontSize: 14, height: 1.5),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            UIHelper.verticalSpace(15),
                                            const Divider(
                                              color: Colors.black45,
                                              height: 2
                                            ),
                                            UIHelper.verticalSpace(15),
                                            InkWell(
                                              child: const Text(Resources.RECORDING_DELETE,
                                                style: TextStyle(
                                                  color: Colors.red, 
                                                  fontSize: 18, 
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.5
                                                )
                                              ),
                                              onTap: (){ 
                                                recordAudioModel.removeAudio(recordAudioModel.audios[index]);
                                                Navigator.pop(context);
                                              },
                                            ),
                                            UIHelper.verticalSpace(15),
                                            const Divider(
                                              color: Colors.black45,
                                              height: 2
                                            ),
                                            UIHelper.verticalSpace(15),
                                            InkWell(
                                              child:  const Text(Resources.RECORDING_CANCEL,
                                                style: TextStyle(
                                                  color: Colors.black, 
                                                  fontSize: 18, 
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.5
                                                )
                                              ),
                                              onTap: () => Navigator.pop(context),
                                            )
                                          ],
                                        ),
                                      ),
                                    )                                 
                                );
                            },
                          )
                      ]
                    )
                )
              ]
          )
        );
  }

  @override
  Widget build(BuildContext context) {
    var recordAudioModel = Provider.of<RecordAudioViewModel>(context);     
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),      
      child: 
        recordAudioModel.audios.length == 0 
        ? notAudios()
        :        
          Column(
            children: 
              [ 
              Container(
                  width: double.infinity,
                  child: 
                    Text(Resources.LATEST_RECORD, 
                      style: TextStyle(color: Colors.black54),
                      textAlign: TextAlign.left
                    )
                ),
                UIHelper.verticalSpace(10),
                lastAudio(context, recordAudioModel),
                UIHelper.verticalSpace(20),
                Container(
                  width: double.infinity,
                  child: 
                    Text(Resources.SAVED_RECORD,   
                    style: TextStyle(color: Colors.black54),
                      textAlign: TextAlign.left
                    )
                ),
                UIHelper.verticalSpace(10),
                ListView.builder(
                  itemCount: recordAudioModel.audios.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true, 
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return itemAudio(context, index, recordAudioModel);
                  },
                )
              ]
            )   
      );     
  }
}
