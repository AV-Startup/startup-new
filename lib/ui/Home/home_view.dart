import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sprinkle/ui/cretepost/crestepostview.dart';
import 'package:sprinkle/ui/profile/profileview.dart';
import 'package:stacked/stacked.dart';
import 'package:animations/animations.dart';
//import 'package:sprinkle/services/router.gr.dart';
//import 'package:stacked_services/stacked_services.dart';
//import 'package:sprinkle/services/locator.dart';
import '../page/page.dart';
import '../Posts/paginationdata.dart';
import 'home_view_model.dart';

class Home extends StatelessWidget {
  //final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.blue])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: model.currentIndex == 2
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.indigoAccent,
                  label: Text('Home'),
                  icon: Icon(Icons.home),
                  onPressed: () {
                    model.setIndex(0);
                  },
                )
              : BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.indigoAccent,
                  //model.currentIndex == 2 ? Colors.transparent : Colors.white,
                  //backgroundColor: Colors.grey[800],
                  currentIndex: model.currentIndex,
                  //== 2 ? model.nav : model.currentIndex,
                  onTap: model.setIndex,
                  items: [
                    BottomNavigationBarItem(
                      label: '',
                      icon: SvgPicture.asset(
                        'assets/top-list.svg',
                        height: 30,
                        width: 30,
                        color: model.currentIndex == 0
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: '',
                      icon: SvgPicture.asset(
                        'assets/edit.svg',
                        height: 30,
                        width: 30,
                        color: model.currentIndex == 1
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: '',
                      icon: SvgPicture.asset(
                        'assets/user.svg',
                        height: 30,
                        width: 30,
                        color: model.currentIndex == 2
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
          body: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 300),
            reverse: model.reverse,
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return SharedAxisTransition(
                child: child,
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
              );
            },
            child: getViewForIndex(model.currentIndex),
            //: model.nav,
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return Postpagination();
      case 1:
        return CreatePost();
      //PostsView();
      case 2:
        return ProfileView();

      //   return ProfileView();
      default:
        return ProfileView();
    }
  }
}

// Container(
//           child: Center(
//               child: RaisedButton(
//             child: Text('Navigate'),
//             onPressed: () async {
//               await _navigationService.navigateWithTransition(
//                 SecondPage(),
//                 transition: 'rotate',
//                 duration: Duration(milliseconds: 500),
//               );
//             },
//           )),
//         ),
