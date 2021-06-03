import 'package:sprinkle/model/user.dart';
//import 'package:sprinkle/services/Firestore_service.dart';
import 'package:sprinkle/services/locator.dart';
import 'package:sprinkle/services/realtimedb.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ViewOtherProfileModel extends BaseViewModel {
  //final FirestoreService _firestoreService = locator<FirestoreService>();
  final RealTimedb _realTimedb = locator<RealTimedb>();
  final NavigationService _navigationService = locator<NavigationService>();
  // String uid = "";
  // getid(String id) {
  //   uid = id;
  //   print("uuuuuuuiiiiiiddd" + uid);
  //   return id;
  // }
  void navback() {
    _navigationService.back();
  }

  Future createuser() async {
    // await _firestoreService
    //     .getUser("WMg3SYPzxYekS9APibUsZf1sH3J2")
    //     .then((value) => print("ddddddddd" + value.toString()));
    await _realTimedb
        .getUser("WMg3SYPzxYekS9APibUsZf1sH3J2")
        .then((value) => print(value.fullName.toString()));

    // await _realTimedb.createUser(User(
    //     id: 'bgydcgdjgdgvdvd',
    //     name: 'hell',
    //     email: 'hghh@hjh.com',
    //     userRole: '56555616',
    //     about: '9556656',
    //     phone: 'cgbkchlsdjhk',
    //     countryCode: 'CO'));
  }

  Future futureToRun(String uid) async {
    User use;
    print("uuuuuuiiiddd fech" + uid.toString());

    var dat = await _realTimedb.getUser(uid).then((value) {
      use = value;
      print("vvvvvvvvvVVVVVVVvvvvvv" +
          use.toString() +
          value.fullName.toString());
    });
    print("ffffffffffffffffffffffffffffffeee" + use.toString());
    //throw UnimplementedError();
    return use;
  }
}
