import 'package:sprinkle/services/Firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:sprinkle/model/post.dart';
//import 'package:sprinkle/services/router.gr.dart';
//import 'package:stacked_services/stacked_services.dart';
import 'package:sprinkle/services/post_service.dart';
import 'package:sprinkle/services/locator.dart';

class PostsViewModel extends BaseViewModel with ReactiveServiceMixin {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  // final FirestoreService _firestoreService = locator<FirestoreService>();
  // final DialogService _dialogService = locator<DialogService>();
  // final CloudStorageService _cloudStorageService =
  //     locator<CloudStorageService>();
  void requestMoreData() => _firestoreService.requestMoreData();

  List<Posts> _posts;
  List<Posts> get posts => _posts;

  void listenToPosts() {
    setBusy(true);

    _firestoreService.listenToPostsRealTime().listen((postsData) {
      List<Posts> updatedPosts = postsData;
      if (updatedPosts != null && updatedPosts.length > 0) {
        _posts = updatedPosts;
        notifyListeners();
      }

      setBusy(false);
    });
  }

  // Future deletePost(int index) async {
  //   var dialogResponse = await _dialogService.showConfirmationDialog(
  //     title: 'Are you sure?',
  //     description: 'Do you really want to delete the post?',
  //     confirmationTitle: 'Yes',
  //     cancelTitle: 'No',
  //   );

  //   if (dialogResponse.confirmed) {
  //     var postToDelete = _posts[index];
  //     setBusy(true);
  //     await _firestoreService.deletePost(postToDelete.documentId);
  //     // Delete the image after the post is deleted
  //     await _cloudStorageService.deleteImage(postToDelete.imageFileName);
  //     setBusy(false);
  //   }
  // }

  // Future navigateToCreateView() async {
  //   await _navigationService.navigateTo(CreatePostViewRoute);
  // }

  // void editPost(int index) {
  //   _navigationService.navigateTo(CreatePostViewRoute,
  //       arguments: _posts[index]);
  // }ViewModel.futureToRun

}
