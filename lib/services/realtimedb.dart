import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprinkle/model/user.dart' as pr;

class RealTimedb {
  final CollectionReference _postsRef =
      FirebaseFirestore.instance.collection('posts');

  FirebaseAuth auth = FirebaseAuth.instance;

  final DatabaseReference db = FirebaseDatabase(
          databaseURL: 'https://startup-e4ab9-default-rtdb.firebaseio.com/')
      .reference();

  //final DatabaseReference userdb = db.child('users');

  Future fetchExist(String pid) async {
    var val;
    await db
        .child('likes')
        .child(pid)
        .child(auth.currentUser.uid)
        .once()
        .then((value) {
      val = value;
      print("valllluee" + value.value.toString());
    });
    // await db.child('likes').child(pid).once().then((value) {
    //   print(value.value.keys.toList().length.toString());
    // });
    print("Vlllllllluuuuuuuuuuuueeeeeeee" + (val.value != null).toString());
    return val.value != null;
  }

  Future addlikes(String pid) async {
    await db.child('likes').child(pid).child(auth.currentUser.uid).set({
      'like': true,
    }).then((value) async {
      await _postsRef.doc(pid).update({'likeCount': FieldValue.increment(1)});
      print("true");
    });
  }

  Future removelikes(String pid) async {
    await db
        .child('likes')
        .child(pid)
        .child(auth.currentUser.uid)
        .child("like")
        .remove()
        .then((value) async {
      await _postsRef.doc(pid).update({'likeCount': FieldValue.increment(-1)});
      print("true");
    });
  }

  Future<void> addReport(String report, String pid, String data) async {
//     url =" https://fir-flutted60b0.firebaseio.com/userprofile.json";
// http.post(url,body:json.encode());
    final url =
        'https://startup-e4ab9-default-rtdb.firebaseio.com/reports.json';
    final timestamp = DateTime.now();
    final response = await http
        .post(
          Uri.parse(url),
          body: json.encode({
            'reports': report,
            'data': data,
            'postid': pid,
            'userid': auth.currentUser.uid,
            'dateTime': timestamp.toIso8601String(),
          }),
        )
        .then((value) => print(value));
  }

  Future createUser(pr.User user) async {
    try {
      await db.child('users').child(user.id).set(user.toJson());
      //await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      //if (e is PlatformException) {
      //  return e.message;
      // }

      return e.toString();
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await db.child('users').child(uid).once();
      //var userData = await _usersCollectionReference.doc(uid).get();
      //print(userData.data().toString());
      // userData.get() => then(User.fromData(userData.data) {
      //   print()
      // });\

      print("rrrr" + userData.value.toString());
      print(userData.value.toString());
      return pr.User.fromRTDBData(userData.value);
    } catch (e) {
      // if (e is PlatformException) {
      //   return e.message;
      // }

      return e.toString();
    }
  }

  Future updateProfile(String name, String bio) async {
    bool val = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await db.child('users').child(auth.currentUser.uid).update({
      'fullName': name,
      'about': bio,
    }).then((value) {
      print("User Added");
      prefs.setString('fullName', name);
      prefs.setString('about', bio);
      val = true;

      //showToast('Updated Succcessfully');
    }).catchError((error) {
      print("Failed to add user: $error");
      val = false;

      //showToast('Failed ');
    });
    return val;
  }
  //db.child('your_db_child').once().then((result) => print('result = $result'));
}
