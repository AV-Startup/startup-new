// import 'package:compound/models/post.dart';
// import 'package:compound/ui/shared/ui_helpers.dart';
// import 'package:compound/ui/widgets/creation_aware_list_item.dart';
// import 'package:compound/ui/widgets/post_item.dart';
// import 'package:compound/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/ui/Posts/post_view_model.dart';
import 'package:stacked/stacked.dart';
import 'createawarelist.dart';
import 'postitem.dart';
//import 'package:provider_architecture/provider_architecture.dart';

class PostView extends StatelessWidget {
  const PostView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostsViewModel>.reactive(
      disposeViewModel: true,
      initialiseSpecialViewModelsOnce: true,
      //viewModel: HomeViewModel(),
      onModelReady: (model) => model.listenToPosts(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Theme.of(context).primaryColor,
        //   child: !model.setBusy(model.listenToPosts()) ? Icon(Icons.add) : CircularProgressIndicator(),
        //   onPressed: () {},
        //   //onPressed: model.navigateToCreateView,
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //verticalSpace(35),

              Expanded(
                  child: model.posts != null
                      ? ListView.builder(
                          itemCount: model.posts.length,
                          itemBuilder: (context, index) =>
                              CreationAwareListItem(
                            itemCreated: () {
                              // when the item is created we request more data when it's the 20th index
                              if (index % 20 == 0) model.requestMoreData();
                            },
                            child: GestureDetector(
                              // onTap: () => model.editPost(index),
                              child: PostItem(
                                data: model.posts[index],
                                //onDeleteItem: () => model.deletePost(index),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Theme.of(context).primaryColor),
                          ),
                        ))
            ],
          ),
        ),
      ),
      viewModelBuilder: () => PostsViewModel(),
    );
  }
}

/*import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'post_view_model.dart';
import 'package:sprinkle/services/locator.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostsViewModel>.reactive(
      disposeViewModel: false,
      // Inidicate that we only want to initialise a specialty viewmodel once
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.grey[900],
        body: model.isBusy
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.purple[200]),
                    ),
                    Text(
                      'Loading Posts',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )
            : !model.hasError
                ? ListView.separated(
                    padding: const EdgeInsets.only(top: 55),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: model.data.length,
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      model.data[index].title,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      model.data[index].body,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Icon(
                                  Icons.star,
                                  color: Colors.purple[200],
                                ),
                              )
                            ],
                          ),
                        ))
                : Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text(
                      model.error.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
        //...
//           ListView.separated(
//   key: PageStorageKey('storage-key'),
//   ...
// )
      ),
      viewModelBuilder: () => locator<PostsViewModel>(),
    );
  }
}
*/
