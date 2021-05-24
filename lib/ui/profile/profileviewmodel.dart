import 'package:flutter/cupertino.dart';
import 'package:sprinkle/model/user.dart';
import 'package:sprinkle/services/Firestore_service.dart';
import 'package:sprinkle/services/locator.dart';
import 'package:sprinkle/services/router.gr.dart';
//import 'package:sprinkle/ui/Editpost/editpostview.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dart:async';
import '../../services/Toastservices.dart';
import '../../services/cuatombottomsheet.dart';

class ProfileViewModel extends FutureViewModel {
  final FirestoreService _fsservice = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final ToastService _toastService = locator<ToastService>();
  //final DialogService _dialogService = locator<DialogService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  int _titleLength = 0, _descLenngth = 0;

  int get titlelength => _titleLength;
  int get desclength => _descLenngth;

  onTitleChanged(String value) {
    _titleLength = value.length;
    notifyListeners();
  }

  onDescChanged(String value) {
    _descLenngth = value.length;
    notifyListeners();
  }

  void update(String name, String bio) async {
    await _firestoreService.updateProfile(name, bio).then((value) async {
      print(value.toString());
      // notifyListeners();
      if (value == true) {
        _toastService.showToast('Updated Successfully');
        print("Upddddddaaatteed");
      } else if (value == false) {
        _toastService.showToast('failed');
        print('Fffffffffffffailed to update');
      }
    });
    //await setgetdatafuture();
    //notifyListeners();
  }

  void showBottom({@required var mode}) async {
    //final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

    await showCustomBottomSheet(mode);
    // showBottomSheet(
    //   title: 'This is my Sheets Title',
    //   description:
    //       'This property will display under the title. We\'re not going to provide a lot of UI versions for the sheet because everyone will have a different style.\nInstead you can use the custom sheet builders as shown below.',
    // );
    //await _dialogService.
    // showDialog(
    //   title: 'Test Dialog Title',
    //   description: 'Test Dialog Description',
    //   dialogPlatform: DialogPlatform.Cupertino,
    // );
  }

  Future showCustomBottomSheet(var mode) async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      customData: mode,
      variant: BottomSheetType.floating,
      title: 'This is a floating bottom sheet',
      description:
          'This sheet is a custom built bottom sheet UI that allows you to show it from any service or viewmodel.',
      mainButtonTitle: 'Awesome!',
      secondaryButtonTitle: 'This is cool',
    );

    print('confirmationResponse confirmed: ${sheetResponse?.confirmed}');
  }
  // ignore: missing_return
  // Future<void> setgetdatafuture() async {
  //   setBusyForObject(_items, true);
  //   var data = await getData();
  //   //setBusyForObject(_hm, false);
  //   _hm = User(
  //       about: data.about,
  //       name: data.name,
  //       email: data.email,
  //       countryCode: data.countryCode);

  //   _items.add(_hm);
  //   notifyListeners();

  //   print(_items[0].name);
  //   setBusyForObject(_items, false);
  //   //notifyListeners();
  // }

  // //User _currentHuman;
  // User get currentHuman => getData;
  void navigateprofile() {
    _navigationService.navigateTo(Routes.editPostView);
  }

  // @override
  // void onSubscribed() {
  //   notifyListeners();
  //   super.onSubscribed();
  // }
  @override
  Future futureToRun() => getData();

  // void futureToRun() async {
  //   var dat = await _fsservice.getdetailProfile();
  //   notifyListeners();
  //   return dat;
  // }

  Future getData() async {
    print('gggggggggggggggggeeeettt data');
    var data = await _fsservice.getdetailProfile();

    notifyListeners();
    return data;
  }

  // @override
  // Stream get stream {
  //   var data = locator<FirestoreService>().getdetailProfile().asStream();
  //   notifyListeners();
  //   return data;
  // }
}
