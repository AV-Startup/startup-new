import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart' as a;
import 'package:shared_preferences/shared_preferences.dart';
import 'Firestore_service.dart';
import 'package:sprinkle/services/locator.dart';
import 'package:sprinkle/model/user.dart';
import 'package:sprinkle/services/Firebase_core.dart';
//import 'package:injectable/injectable.dart';

//@lazySingleton
class AuthenticationService {
  final a.FirebaseAuth _firebaseAuth = a.FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final CoreService _coreservice = locator<CoreService>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future getdata(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var snp = await users.doc(uid).get();
    var name = snp.data()['fullName'];
    //var snapshot = users.doc(uid);

    //name = data.data.data()['name'];
    prefs.setString('name', name);
    prefs.setString('email', snp.data()['email']);
    prefs.setString('countryCode', snp.data()['countryCode']);
    prefs.setString('about', snp.data()['about']);
    prefs.setString('phone', snp.data()['phone']);
  }

  User _currentUser;
  User get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var j = await _coreservice.getLogStatus();
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await getdata(user.user.uid);
      if ((user != null) == true) {
        if (j == false) {
          //logic for cache delete Startup logic
          //_coreservice.adddetails(email);
        }
      }
      return user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail(
      {@required String email,
      @required String password,
      @required String fullName,
      @required String role,
      @required String countryCode,
      @required String phone}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      _currentUser = User(
        id: authResult.user.uid,
        email: email,
        name: fullName,
        userRole: role,
        phone: phone,
        about: 'Hey i am new User',
        countryCode: countryCode,
      );
      //await getdata(authResult.user.uid);
      //await _coreservice.adddetails(email);
      await _firestoreService.createUser(_currentUser);
      prefs.setString('name', fullName);
      prefs.setString('email', email);
      prefs.setString('countryCode', countryCode);
      prefs.setString('about', 'Hey i am new User');
      prefs.setString('phone', phone);
      prefs.setString('role', role);
      //await getdata(authResult.user.uid);

      return authResult.user != null;
    } catch (e) {
      print(e.message.toString());
      return e.message.toString();
    }
  }

  Future<bool> isUserLoggedIn() async {
    a.User userd = _firebaseAuth.currentUser;
    await _populateCurrentUser(userd);
    return userd != null;
  }

  Future _populateCurrentUser(a.User user) async {
    if (user != null) {
      await _firestoreService.getUser(user.uid).then((value) {
        print(value.toString());
      });
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
