import 'package:injectable/injectable.dart';
import 'package:sprinkle/services/realtimedb.dart';
import 'package:sprinkle/ui/ViewOtherProf/ViewOtherProfmodel.dart';
import 'package:sprinkle/ui/ViewOtherProf/ViewProfile.dart';
import 'package:sprinkle/ui/profile/profileviewmodel.dart';
import 'package:stacked_services/stacked_services.dart';
import 'Firebase_auth.dart';
import 'Firebase_core.dart';
import 'Firestore_service.dart';
import 'Firebase_messaging.dart';
import 'Toastservices.dart';
//import '../ui/Posts/post_view_model.dart';
import 'api.dart';
import 'post_service.dart';

@module
abstract class ThirdPartyServicesModules {
  @lazySingleton
  NavigationService get navigationservice;
  @lazySingleton
  DialogService get dialogservice;
  @lazySingleton
  AuthenticationService get authenticationService;
  @lazySingleton
  CoreService get coreservice;
  @lazySingleton
  FirestoreService get firestroreservice;
  @lazySingleton
  PushNotificationService get pushnotificationservice;
  // @lazySingleton
  // PostsViewModel get postviewmodel;
  @lazySingleton
  ProfileViewModel get profileviewmodel;
  @lazySingleton
  Api get api;
  @lazySingleton
  ToastService get toastservice;
  @lazySingleton
  BottomSheetService get bottomSheetService;
  @lazySingleton
  RealTimedb get realtimedb;
  @lazySingleton
  ViewOtherProfileModel get viewOtherProfileModel;
}
