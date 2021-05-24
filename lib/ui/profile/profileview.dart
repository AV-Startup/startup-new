import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sprinkle/services/locator.dart';
import 'package:sprinkle/ui/Editpost/editprofileviewmodel.dart';
import 'package:sprinkle/ui/profile/profileviewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:sprinkle/capitilize.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return ViewModelBuilder<ProfileViewModel>.reactive(
      disposeViewModel: false,
      //onModelReady: (viewModel) => viewModel.setgetdatafuture(),
      createNewModelOnInsert: true,
      //fireOnModelReadyOnce: true,
      // Inidicate that we only want to initialise a specialty viewmodel once
      //initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) {
        // child:
        // Center(
        //   child: CircularProgressIndicator(),
        // );
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.blue])),
          child: Scaffold(
            // appBar: CupertinoNavigationBar(
            //   middle: Text('Profile'),
            // ),
            backgroundColor: Colors.transparent,
            //backgroundColor: Colors.white,
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
                                                  FittedBox(
                                                    child: Flag(
                                                      model.data.countryCode
                                                          .toString(),
                                                      height: 30,
                                                      width: 55,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
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
                                    /////////////////////neumo end
                                    // SizedBox(
                                    //   height: 6,
                                    // ),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          /*CupertinoButton(
                                            color: Colors.blueGrey,
                                            child: Text('Edit Profile'),
                                            onPressed: () {
                                              model.showBottom(mode: model);
                                            },
                                          )*/
                                          Container(
                                            // decoration: const BoxDecoration(
                                            //   gradient: LinearGradient(
                                            //     colors: <Color>[
                                            //       Color(0xFF0D47A1),
                                            //       Color(0xFF42A5F5),
                                            //     ],
                                            //   ),
                                            // ),
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
                                        /*SvgPicture.asset(
                                              'assets/user-circle.svg',
                                              color: Colors.tealAccent,
                                            ))*/
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //],

                            // )

                            //Text(model.data.phone.toString()),
                            // CupertinoButton(
                            //   child: Text('butt'),
                            //   onPressed: () {
                            //     print(model.data.name);
                            //     print(model.data.email);
                            //     print(model.data.userRole);
                            //     print(model.data.countryCode);
                            //   },
                            // )
                            //Text(model.data['email']),
                            //your stuff
                          ],
                        ),
                      ],
                    ),
                  )
                // )
                //]
                // )
                //)
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            // floatingActionButton: FloatingActionButton(
            //   child: Icon(Icons.ac_unit_outlined),
            //   onPressed: () {},
            // ),
          ),
        );
      },

      viewModelBuilder: () => locator<ProfileViewModel>(),
    );
  }
}
