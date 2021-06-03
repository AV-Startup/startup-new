import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sprinkle/model/user.dart';
import 'package:sprinkle/services/locator.dart';
import 'package:sprinkle/capitilize.dart';
import 'package:flag/flag.dart';
import 'package:stacked/stacked.dart';
import 'ViewOtherProfmodel.dart';

class ViewOtherProfile extends StatelessWidget {
  final dae;
  ViewOtherProfile({this.dae});
  String name;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewOtherProfileModel>.reactive(
      disposeViewModel: false,

      //initialiseSpecialViewModelsOnce: true,
      // onModelReady: (model) {
      //   // model.getid(dae);
      //   // model.initialise();
      // },
      builder: (context, model, child) {
        return Container(
            //backgroundColor: Colors.white,
            child: FutureBuilder<dynamic>(
                future: model.futureToRun(dae),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error Occoured"),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 32.0),
                                  child: SvgPicture.asset(
                                    'assets/viewprofile.svg',
                                    height: 70,
                                    width: 70,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () {
                                  model.navback();
                                },
                              )
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/me.svg',
                                  height: 30,
                                  width: 30,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                snapshot.data.fullName.toString().capitalize(),
                                //model.data.name.toString().capitalize(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                  snapshot.data.email.toString(),
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/globe.svg',
                                  height: 30,
                                  width: 30,
                                  color: Colors.black,
                                ),
                              ),
                              FittedBox(
                                child: Flag(
                                  snapshot.data.countryCode.toString(),
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
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/asterisk.svg',
                                  height: 30,
                                  width: 30,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                snapshot.data.userRole.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          //Text(model.data.countryCode.toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/selfie.svg',
                                  height: 30,
                                  width: 30,
                                  color: Colors.black,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  snapshot.data.about.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),

                          //ElevatedButton(onPressed: () {}, child: Text('Pop'))
                          // Row(children: [
                          // Container(
                          //   height: 150,
                          //   child: CupertinoDialogAction(
                          //     isDefaultAction: true,
                          //     child: Text("Yes"),
                          //   ),
                          // ),
                          // CupertinoDialogAction(
                          //   child: Text("No"),
                          // )
                          //])
                        ]),
                    //     ),
                    //   ),
                    // ]
                    //     // ],
                    //     //)))]
                    //     ),
                    /*Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data.name.toString().capitalize(),
                          //model.data.name.toString().capitalize(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        FlatButton(
                            onPressed: () {
                              model.createuser();
                            },
                            child: Text('hgffffg'))
                      ],
                    ),*/
                  );
                }));
      },
      viewModelBuilder: () => locator<ViewOtherProfileModel>(),
    );
  }
}
/*
Padding(
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
                              // alignment: Alignment.center,
                              // height: 400,
                              // width: 350,
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
                                                    snapshot.data
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
                                                      snapshot.data.toString(),
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
                                                      snapshot.data.toString(),
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
                                                    snapshot.data.toString(),
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
                                                      snapshot.data.toString(),
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
                                          child: SvgPicture.asset(
                                              'assets/viewprofile.svg'),
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
                  );*/
