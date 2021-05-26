import 'package:flutter/foundation.dart';

class Posts {
  final String title;
  final String publisherId;
  final String desc;
  final String timestamp;
  final int epochs;
  final String flagCode;
  final int likeCount;
  final String keywords;
  final String name;

  Posts(
      {@required this.publisherId,
      @required this.desc,
      this.name,
      this.title,
      this.timestamp,
      this.epochs,
      this.flagCode,
      this.likeCount,
      this.keywords});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'publisherId': publisherId,
      'desc': desc,
      'timestamp': timestamp,
      'epochs': epochs,
      'flagCode': flagCode,
      'likeCount': likeCount,
      'keywords': keywords
    };
  }

  static Posts fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Posts(
        title: map['title'],
        name: map['name'],
        publisherId: documentId,
        desc: map['desc'],
        timestamp: map['timestamp'],
        epochs: map['epochs'],
        flagCode: map['flagCode'],
        likeCount: map['likeCount'],
        keywords: map['keywords']);
  }
}

//import 'package:flutter/services.dart';
/*
class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
//jbkb54564568kguyujtigb8ku7yijfbytvfktxckmvubj.l,ikjhgbyvtxezxctvfgbuhjlkkfxectf
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
*/
