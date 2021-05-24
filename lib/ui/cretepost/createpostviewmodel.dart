import 'package:sprinkle/model/post.dart';
import 'package:sprinkle/services/Firebase_auth.dart';
import 'package:sprinkle/services/Firestore_service.dart';
import 'package:sprinkle/services/locator.dart';
import 'package:stacked/stacked.dart';

class CreatePostViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  int _titleLength = 0, _descLenngth = 0; // _requirementslength = 0;
  //int descLenngth = '     ';
  int get selectedRole => _descLenngth;
  int get titleLength => _titleLength;
  //int get requirementslength => _requirementslength;

  onTitleChanged(String value) {
    _titleLength = value.length;
    notifyListeners();
  }

  onDescChanged(String value) {
    _descLenngth = value.length;
    notifyListeners();
  }

  Future submit(Posts post) async {
    await _firestoreService.createPost(post);
  }

  // onReqChanged(String value) {
  //   _requirementslength = value.length;
  // }

  // onPressed: () async {
  // prefs = await SharedPreferences.getInstance();
  // DateTime dt = DateTime.now();

  // fs
  //     .createPost(Post(
  //   publisherId: auth.currentUser.uid,
  //   desc: descController.text,
  //   title: titleController.text,
  //   flagCode: prefs.getString('countryCode'),
  //   timestamp: dt.toString(),
  //   epochs: '2000',
  //   keywords: keys.join(","),
  //   likeCount: '0',
  // ))
  //     .then((value) {
  //   showToast('Posted Successfully');
  // });
  // keywordController.clear();
  // descController.clear();
  // titleController.clear();
  //        }
}
