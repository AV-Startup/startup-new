import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sprinkle/ui/chatscreen/chatView.dart';
import 'package:sprinkle/ui/profile/profileview.dart';
import 'package:sprinkle/ui/userChatscreen/userChatUi.dart';
import 'package:stacked/stacked.dart';
import 'package:animations/animations.dart';
//import 'package:sprinkle/services/router.gr.dart';
//import 'package:stacked_services/stacked_services.dart';
//import 'package:sprinkle/services/locator.dart';
//import '../page/page.dart';
import '../Posts/paginationdata.dart';
import 'home_view_model.dart';

class Home extends StatefulWidget {
  //final NavigationService _navigationService = locator<NavigationService>();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int segmentedControlValue = 0;
  Color activeIcon = Colors.blue.shade200;
  Color inactiveIcon = Colors.indigoAccent;

  Widget segmentedControl() {
    return Container(
      width: 300,
      child: CupertinoSlidingSegmentedControl(
          groupValue: segmentedControlValue,
          backgroundColor: Colors.blue.shade200,
          children: const <int, Widget>{
            0: Text(
              'Dark',
              style: TextStyle(color: Colors.black),
            ),
            1: Text(
              'Color',
              style: TextStyle(color: Colors.black),
            ),
            2: Text(
              'Normal',
              style: TextStyle(color: Colors.black),
            )
          },
          onValueChanged: (value) {
            setState(() {
              segmentedControlValue = value;
            });
            print(segmentedControlValue.toString());
            if (segmentedControlValue == 1) {
              //setState(() {
              activeIcon = Colors.white;
              inactiveIcon = Colors.black;
              chan = null;
              dec = BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.purple, Colors.blue]));
              //});
            } else if (segmentedControlValue == 2) {
              //setState(() {
              activeIcon = Colors.white;
              inactiveIcon = Colors.black;
              chan = Colors.blueGrey;
              dec = null;
              // });
            } else {
              activeIcon = Colors.blue.shade200;
              inactiveIcon = Colors.indigoAccent;
              chan = null;
              dec = null;
            }
          }),
    );
  }

  Color chan;
  var dec;
  // bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Container(
        color: chan,

        //Colors.blueGrey,
        decoration: dec,
        child: Scaffold(
          appBar: model.currentIndex == 2
              ? AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  centerTitle: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      segmentedControl(),
                    ],
                  ),
                  // actions: [
                  //segmentedControl(),

                  /*CupertinoSwitch(
                      // dragStartBehavior: ,
                      activeColor: Colors.indigoAccent,
                      trackColor: Colors.blueGrey,
                      value: _switchValue,
                      onChanged: (v) {
                        setState(() {
                          _switchValue = !_switchValue;
                        });
                        if (v == true) {
                          setState(() {
                            chan = null;
                            dec = BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Colors.purple, Colors.blue]));
                          });
                        } else {
                          setState(() {
                            chan = Colors.blueGrey;
                            dec = null;
                          });
                        }
                        print(v);
                      },
                    ),*/
                  // ],
                )
              : null,
          // AppBar(
          //     backgroundColor: Colors.transparent,
          //     elevation: 0.0,
          //   ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar:
              // model.currentIndex == 2
              //     ? FloatingActionButton.extended(
              //         backgroundColor: Colors.indigoAccent,
              //         label: Text('Home'),
              //         icon: Icon(Icons.home),
              //         onPressed: () {
              //           model.setIndex(0);
              //         },
              //       )
              //     :
              BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            //backgroundColor: Colors.indigoAccent,
            //model.currentIndex == 2 ? Colors.transparent : Colors.white,
            backgroundColor: Color(0x00ffffff),
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
                  color: model.currentIndex == 0 ? inactiveIcon : activeIcon,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset(
                  'assets/message.svg',
                  height: 30,
                  width: 30,
                  color: model.currentIndex == 1 ? inactiveIcon : activeIcon,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset(
                  'assets/user.svg',
                  height: 30,
                  width: 30,
                  color: model.currentIndex == 2 ? inactiveIcon : activeIcon,
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
        return ChatPage();
      //ChatView();
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
