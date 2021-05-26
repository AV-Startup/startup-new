import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'locator.dart';

//DialogService.registerCustomDialogBuilder(variant: Dialog.basic, builder: (context, request, completer) => Dialog(...))
void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.form: (context, sheetRequest, completer) =>
        _FormDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class _FormDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _FormDialog({Key key, this.request, this.completer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TextField(
            //   decoration: new InputDecoration(
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.black, width: 1.0),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Colors.black, width: 1.0),
            //     ),
            //     hintText: 'Write Report',
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            CupertinoButton(
              color: Colors.blueGrey,
              child: Text('Ok'),
              onPressed: () {
                request.customData();
              },
            )
          ],
        ),
      ),
    ));
  }
}

//setupDialogUi();
enum DialogType { form }
