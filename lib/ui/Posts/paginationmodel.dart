import 'package:flutter/cupertino.dart';
import 'package:sprinkle/services/Toastservices.dart';
import 'package:sprinkle/services/locator.dart';
import 'package:sprinkle/services/realtimedb.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PaginationModel extends FutureViewModel<bool> {
  final RealTimedb _realTimedb = locator<RealTimedb>();
  // final DialogService _dialogService = locator<DialogService>();
  final ToastService _toastService = locator<ToastService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void showCuper(var ctx, String pid, String data) {
    final action = CupertinoActionSheet(
      title: Text(
        "Report Post",
        style: TextStyle(fontSize: 20),
      ),
      message: Text(
        "Choose the action",
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("HateSpeech"),
          isDefaultAction: true,
          onPressed: () {
            addReport("Hate Speech", pid, data);
            remove();
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Violence"),
          isDestructiveAction: true,
          onPressed: () {
            addReport("Violence", pid, data);
            remove();
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Bullying & others"),
          isDefaultAction: true,
          onPressed: () {
            addReport("Bullying and others", pid, data);
            remove();
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Sexual Assault"),
          isDefaultAction: true,
          onPressed: () {
            addReport("Sexual assault", pid, data);
            remove();
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(ctx);
        },
      ),
    );
    showCupertinoModalPopup(context: ctx, builder: (context) => action);
  }

  String id;

  Future fetchExist(String pid) async {
    ///setBusy(true);
    var ct = await _realTimedb.fetchExist(pid);
    print("Mmmmmodddell vall" + ct.toString());

    ///setBusy(false);
    notifyListeners();
    return ct;
  }

  Future addLikes(String pid) async {
    print("liked");
    await _realTimedb.addlikes(pid);
  }

  Future removeLikes(String pid) async {
    print("Unliked");
    await _realTimedb.removelikes(pid);
  }

  Future addReport(String report, String postid, String data) async {
    await _realTimedb.addReport(report, postid, data).then((value) {
      print("Report");
      _toastService.showToast("Reported Successfully");
    });
  }

  Future remove() async {
    _navigationService.back();
  }

  // Future showDialog() async {
  //   await _dialogService.showCustomDialog(
  //     customData: remove,
  //     variant: DialogType
  //         .form, // Which builder you'd like to call that was assigned in the builders function above.
  //     title: 'This is a custom UI with Text as main button',
  //     description: 'Sheck out the builder in the dialog_ui_register.dart file',
  //     mainButtonTitle: 'Ok',
  //   );
  // }

  @override
  Future<bool> futureToRun() => fetchExist(id);
}

//  CupertinoAlertDialog(
//   title: new Text("Dialog Title"),
//   content: new Text("This is my content"),
//   actions: <Widget>[
//     CupertinoDialogAction(
//       isDefaultAction: true,
//       child: Text("Yes"),
//     ),
//     CupertinoDialogAction(
//       child: Text("No"),
//     )
//   ],
// )
