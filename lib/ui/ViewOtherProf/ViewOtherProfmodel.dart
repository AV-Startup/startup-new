import 'package:sprinkle/services/Firestore_service.dart';
import 'package:stacked/stacked.dart';

class ViewOtherProfileModel extends BaseViewModel {
  final FirestoreService _firestoreService = FirestoreService();
  // String uid = "";
  // getid(String id) {
  //   uid = id;
  //   print("uuuuuuuiiiiiiddd" + uid);
  //   return id;
  // }

  Future futureToRun(String uid) async {
    print("uuuuuuiiiddd fech" + uid.toString());

    var dat = await _firestoreService.getUser(uid).then((value) {});
    print("ffffffffffffffffffffffffffffffeee" + dat.toString());
    //throw UnimplementedError();
    return dat;
  }
}
