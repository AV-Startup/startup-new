import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sprinkle/services/locator.dart';
import 'package:sprinkle/capitilize.dart';
import 'package:flag/flag.dart';
import 'package:stacked/stacked.dart';
import 'ViewOtherProfmodel.dart';

class ViewOtherProfile extends StatelessWidget {
  final dae;
  ViewOtherProfile({this.dae});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewOtherProfileModel>.reactive(
      disposeViewModel: false,
      //initialiseSpecialViewModelsOnce: true,
      onModelReady: (model) {
        // model.getid(dae);
        // model.initialise();
      },
      builder: (context, model, child) {
        return Container(
          height: 400,
          width: 350,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.blue])),
          child: Scaffold(
              backgroundColor: Colors.white,
              body: StreamBuilder<Object>(
                  stream: model.futureToRun(dae).asStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error Occoured"),
                      );
                    }
                    return Container(
                      child: Padding(
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
                                                            const EdgeInsets
                                                                .all(8.0),
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
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
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
                                                          snapshot.data
                                                              .toString(),
                                                          overflow:
                                                              TextOverflow.fade,
                                                          softWrap: false,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
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
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/globe.svg',
                                                          height: 30,
                                                          width: 30,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      FittedBox(
                                                        child: Flag(
                                                          snapshot.data
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
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/asterisk.svg',
                                                          height: 30,
                                                          width: 30,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot.data
                                                            .toString(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
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
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SvgPicture.asset(
                                                          'assets/selfie.svg',
                                                          height: 30,
                                                          width: 30,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          snapshot.data
                                                              .toString(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
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
                      ),
                    );
                  })),
        );
      },
      viewModelBuilder: () => locator<ViewOtherProfileModel>(),
    );
  }
}
