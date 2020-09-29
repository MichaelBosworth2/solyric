import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/ChordInfo/viewModel/ChordTabsViewModel.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:provider/provider.dart';

class PianoChordInformation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chords = Provider.of<ChordTabsViewModel>(context).localChords;
    return Container(
      decoration: _backgroundDecoration(),
    );
  }

  BoxDecoration _backgroundDecoration() => BoxDecoration(
      image: DecorationImage(
          image: AssetImage(Resources.BACKGROUND_GRADIENT), fit: BoxFit.fill));

}