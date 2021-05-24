import 'package:sprinkle/services/locator.dart';
import 'package:sprinkle/services/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  void nav() {
    _navigationService.navigateTo(Routes.profileView);
  }
}
