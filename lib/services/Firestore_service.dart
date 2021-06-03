import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprinkle/model/post.dart';
import 'package:sprinkle/model/user.dart';
import 'dart:async';

class FirestoreService {
  SharedPreferences prefs;
  fa.FirebaseAuth auth = fa.FirebaseAuth.instance;

  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _postsCollectionReference =
      FirebaseFirestore.instance.collection('posts');
  // List<List<Posts>> _allPagedResults = List<List<Posts>>();
  // final StreamController<List<Posts>> _postsController =
  //     StreamController<List<Posts>>.broadcast();
  // DocumentSnapshot _lastDocument;

  // bool _hasMorePosts = true;

  /* Future updateProfile(String name, String bio) async {
    bool val = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await _usersCollectionReference.doc(auth.currentUser.uid).update({
      'name': name,
      'about': bio,
    }).then((value) {
      print("User Added");
      prefs.setString('name', name);
      prefs.setString('about', bio);
      val = true;

      //showToast('Updated Succcessfully');
    }).catchError((error) {
      print("Failed to add user: $error");
      val = false;

      //showToast('Failed ');
    });
    return val;
  }*/

  Future getdetailProfile() async {
    prefs = await SharedPreferences.getInstance();

    return User(
      fullName: prefs.getString('fullName'),
      email: prefs.getString('email'),
      countryCode: prefs.getString('countryCode'),
      about: prefs.getString('about'),
      phone: prefs.getString('phone'),
      userRole: prefs.getString('role'),
    );
  }

  Future createPost(Posts post) async {
    _postsCollectionReference.add(post.toMap()).then((value) {
      return "success";
    });
  }

  // Future submit() async {
  //   prefs = await SharedPreferences.getInstance();
  //   DateTime dt = DateTime.now();
  // }
////////////////////////////////////--------------------------------------------------
/*
  Future createUser(User user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      //print(userData.data().toString());
      // userData.get() => then(User.fromData(userData.data) {
      //   print()
      // });
      //print("rrrrrrr" + userData.data().toString());
      return User.fromData(userData.data());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }*/
}

// Stream listenToPostsRealTime() {
//   _requestPosts();
//   return _postsController.stream;
// }

// void _requestPosts() {
//   var pagePostsQuery = _postsCollectionReference
//       .orderBy('title')
//       // #3: Limit the amount of results
//       .limit(20);

//   if (_lastDocument != null) {
//     pagePostsQuery = pagePostsQuery.startAfterDocument(_lastDocument);
//   }

//   if (!_hasMorePosts) return;

//   var currentRequestIndex = _allPagedResults.length;

//   pagePostsQuery.snapshots().listen((postsSnapshot) {
//     if (postsSnapshot.docs.isNotEmpty) {
//       var posts = postsSnapshot.docs
//           .map((snapshot) => Posts.fromMap(snapshot.data(), snapshot.id))
//           .where((mappedItem) => mappedItem.title != null)
//           .toList();
//       var pageExists = currentRequestIndex < _allPagedResults.length;

//       // If the page exists update the posts for that page
//       if (pageExists) {
//         _allPagedResults[currentRequestIndex] = posts;
//       }
//       // If the page doesn't exist add the page data
//       else {
//         _allPagedResults.add(posts);
//       }

//       // Concatenate the full list to be shown
//       var allPosts = _allPagedResults.fold<List<Posts>>(List<Posts>(),
//           (initialValue, pageItems) => initialValue..addAll(pageItems));

//       //  Broadcase all posts
//       _postsController.add(allPosts);
//       // Add the posts onto the controller
//       //_postsController.add(posts);
//       // Save the last document from the results only if it's the current last page
//       if (currentRequestIndex == _allPagedResults.length - 1) {
//         _lastDocument = postsSnapshot.docs.last;
//       }

//       // Determine if there's more posts to request
//       _hasMorePosts = posts.length == 20;
//     }
//   });
// }

// void requestMoreData() => _requestPosts();
//}
