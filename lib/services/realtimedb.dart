import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RealTimedb {
  final CollectionReference _postsRef =
      FirebaseFirestore.instance.collection('posts');
  FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference db = FirebaseDatabase(
          databaseURL: 'https://startup-e4ab9-default-rtdb.firebaseio.com/')
      .reference();

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

  //db.child('your_db_child').once().then((result) => print('result = $result'));
}
