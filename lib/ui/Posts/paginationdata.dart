import 'package:flutter/material.dart';
import 'package:paginate_firestore/bloc/pagination_listeners.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sprinkle/ui/Posts/paginationmodel.dart';
import 'package:sprinkle/ui/Posts/postitem.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class Postpagination extends StatelessWidget {
  Postpagination({Key key}) : super(key: key);
  PaginateRefreshedChangeListener refreshChangeListener =
      PaginateRefreshedChangeListener();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaginationModel>.reactive(
      builder: (context, model, child) => Container(
        // color: Colors.purple,
        child: SafeArea(
          child: Scaffold(
            // appBar: AppBar(
            //   title: Text('Firestore pagination example'),
            //   centerTitle: true,
            // ),
            body: Container(
              // decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //         begin: Alignment.topLeft,
              //         end: Alignment.bottomRight,
              //         colors: [Colors.purple, Colors.blue])),
              child: RefreshIndicator(
                backgroundColor: Colors.white,
                child: PaginateFirestore(
                  itemsPerPage: 6,
                  //item builder type is compulsory.
                  itemBuilderType:
                      PaginateBuilderType.listView, //Change types accordingly
                  itemBuilder: (index, context, documentSnapshot) => PostItem(
                    data: documentSnapshot,
                    mod: model,
                  ),
                  listeners: [
                    refreshChangeListener,
                  ],
                  //startAfterDocument: ,
                  /*ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text(documentSnapshot.data()['title']),
                  subtitle: Text(documentSnapshot.data()['desc']),
                ),*/
                  // orderBy is compulsory to enable pagination
                  query: FirebaseFirestore.instance
                      .collection('posts')
                      .orderBy('epochs', descending: true)
                      .orderBy('likeCount', descending: true),

                  // to fetch real-time data
                  isLive: true,
                ),
                onRefresh: () async {
                  refreshChangeListener.refreshed = true;
                },
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => PaginationModel(),
    );
  }
}
