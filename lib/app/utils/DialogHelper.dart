import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/post/util/ConfirmationAction.dart';

import 'Resources.dart';

class DialogHelper {
  /// Asks user to save data before exiting this screen
  static Future<ConfirmationAction> wantToSaveYourLyric(
          BuildContext context, String title) =>
      showDialog<ConfirmationAction>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: const Text(Resources.DIALOG_CONTENT),
              actions: <Widget>[
                FlatButton(
                  child: const Text(ConfirmationConstants.DISCARD),
                  textColor: Theme.of(context).primaryColorDark,
                  onPressed: () =>
                      Navigator.of(context).pop(ConfirmationAction.Discard),
                ),
                FlatButton(
                  child: const Text(ConfirmationConstants.YES),
                  textColor: Theme.of(context).primaryColorDark,
                  onPressed: () =>
                      Navigator.of(context).pop(ConfirmationAction.Yes),
                )
              ],
            );
          });
}
