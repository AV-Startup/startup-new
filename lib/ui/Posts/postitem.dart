import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final data;
  PostItem({this.data});
  @override
  Widget build(BuildContext context) {
    print(data.title);
    return Container(
      child: Card(
        child: Column(
          children: [
            Text(data.desc),
            Text(data.likeCount),
            Text(data.flagCode),
            Text(data.epochs),
            Text(data.timestamp),
            Text(data.title),
            Text(data.keywords),
          ],
        ),
      ),
    );
  }
}
