import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sprinkle/services/locator.dart';
//import 'package:sprinkle/ui/Editpost/editprofileviewmodel.dart';
import 'package:sprinkle/ui/profile/profileviewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:sprinkle/capitilize.dart';
//import 'package:stacked_services/stacked_services.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return ViewModelBuilder<ProfileViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.blue])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: !(model.isBusy)
                ? Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 400,
                              width: 350,
                              child: Stack(
                                children: [
                                  Column(children: [
                                    SizedBox(
                                      height: 85,
                                    ),

                                    ///neumorphoic
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/me.svg',
                                                      height: 30,
                                                      width: 30,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    model.data.name
                                                        .toString()
                                                        .capitalize(),
                                                    //model.data.name.toString().capitalize(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/at.svg',
                                                      height: 30,
                                                      width: 30,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    fit: FlexFit.loose,
                                                    child: Text(
                                                      model.data.email
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.fade,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/globe.svg',
                                                      height: 30,
                                                      width: 30,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  // FittedBox(
                                                  //   child: Flag(
                                                  //     model.data.countryCode
                                                  //         .toString(),
                                                  //     height: 30,
                                                  //     width: 55,
                                                  //     fit: BoxFit.fill,
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  //assets/asterisk.svg
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/asterisk.svg',
                                                      height: 30,
                                                      width: 30,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    model.data.userRole
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                ],
                                              ),
                                              //Text(model.data.countryCode.toString()),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/selfie.svg',
                                                      height: 30,
                                                      width: 30,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      model.data.about
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                      ),
                                    ),

                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.cyanAccent,
                                                ),
                                                child: Text(
                                                  'Edit profile',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                onPressed: () async {
                                                  model.showBottom(mode: model);
                                                }),
                                          ),
                                        ]),
                                  ]
                                      // ],
                                      //)))]
                                      ),
                                  Positioned(
                                    left: 105,
                                    right: 105,

                                    // height: 50,
                                    // width: 50,
                                    top: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 120,
                                          child: Image.asset('assets/user.png'),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
      viewModelBuilder: () => locator<ProfileViewModel>(),
    );
  }
}
