import 'package:flutter/material.dart';
import 'package:sprinkle/services/Firestore_service.dart';
import 'package:sprinkle/services/locator.dart';
import 'package:stacked/stacked.dart';

class EditPostViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
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
    await _firestoreService.updateProfile(name, bio).then((value) {
      if (value == true) {
        print("Upddddddaaatteed");
      } else if (value == false) {
        print('Fffffffffffffailed to update');
      }
    });
    //notifyListeners();
  }
}
