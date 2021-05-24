// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import 'api.dart';
import 'Firebase_auth.dart';
import 'Firebase_core.dart';
import 'Firestore_service.dart';
import '../ui/profile/profileviewmodel.dart';
import 'Firebase_messaging.dart';
import 'register_packages.dart';
import 'Toastservices.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModules = _$ThirdPartyServicesModules();
  gh.lazySingleton<Api>(() => thirdPartyServicesModules.api);
  gh.lazySingleton<AuthenticationService>(
      () => thirdPartyServicesModules.authenticationService);
  gh.lazySingleton<BottomSheetService>(
      () => thirdPartyServicesModules.bottomSheetService);
  gh.lazySingleton<CoreService>(() => thirdPartyServicesModules.coreservice);
  gh.lazySingleton<DialogService>(
      () => thirdPartyServicesModules.dialogservice);
  gh.lazySingleton<FirestoreService>(
      () => thirdPartyServicesModules.firestroreservice);
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModules.navigationservice);
  gh.lazySingleton<ProfileViewModel>(
      () => thirdPartyServicesModules.profileviewmodel);
  gh.lazySingleton<PushNotificationService>(
      () => thirdPartyServicesModules.pushnotificationservice);
  gh.lazySingleton<ToastService>(() => thirdPartyServicesModules.toastservice);
  return get;
}

class _$ThirdPartyServicesModules extends ThirdPartyServicesModules {
  @override
  Api get api => Api();
  @override
  AuthenticationService get authenticationService => AuthenticationService();
  @override
  BottomSheetService get bottomSheetService => BottomSheetService();
  @override
  CoreService get coreservice => CoreService();
  @override
  DialogService get dialogservice => DialogService();
  @override
  FirestoreService get firestroreservice => FirestoreService();
  @override
  NavigationService get navigationservice => NavigationService();
  @override
  ProfileViewModel get profileviewmodel => ProfileViewModel();
  @override
  PushNotificationService get pushnotificationservice =>
      PushNotificationService();
  @override
  ToastService get toastservice => ToastService();
}
