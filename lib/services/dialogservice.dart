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
    return Dialog(child: Text('data'));
  }
}

//setupDialogUi();
enum DialogType { form }
