import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../ViewOtherProf/ViewProfile.dart';

///import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:like_button/like_button.dart';
import 'package:sprinkle/capitilize.dart';
import 'package:sprinkle/ui/Posts/paginationmodel.dart';
import 'package:stacked/stacked.dart';

// class PostItem extends StatefulWidget {
//   final data;

//   PostItem({this.data});
//   @override
//   _PostItemState createState() => _PostItemState();
// }

class PostItem extends StatelessWidget {
  //bool Visible = true;
  final data;
  final mod;
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    print("object");

    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    if (!isLiked) {
      mod.fetchExist(data.id);
      Future.delayed(Duration(milliseconds: 2000))
          .then((value) => print(value));
      print("liked");
    } else {
      Future.delayed(Duration(milliseconds: 2000))
          .then((value) => print(value));
      print("notliked");
    }

    return !isLiked;
  }

  PostItem({this.data, this.mod});
  @override
  Widget build(BuildContext context) {
    //print(data.id.toString());
    List<Widget> card = data.data()['keywords'].toString().split(",").map((e) {
      return Card(
        color: Colors.indigoAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(e.toString().capitalize()),
        ),
      );
    }).toList();
    //print(data.title);
    return ViewModelBuilder<PaginationModel>.reactive(
      onModelReady: (viewModel) {
        //viewModel.onData(data.id);
        viewModel.fetchExist(data.id);
      },
      builder: (context, model, child) => Stack(
        children: [
          InkWell(
            // onDoubleTap: () {
            //   print("tappped");
            // },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  //color: Color.fromRGBO(153, 118, 234, 1.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            // IconButton(
                            //   icon:
                            //       Icon(CupertinoIcons.ellipsis_vertical_circle),
                            //   onPressed: () {},
                            // ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => ViewOtherProfile(
                                    dae: data.data()['publisherId'],
                                  ),
                                );
                                print("profile");
                              },
                              child: SvgPicture.asset(
                                'assets/viewprofile.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            data.data()['flagCode'] != null
                                ? FittedBox(
                                    child: Flag(
                                      data.data()['flagCode'].toString(),
                                      height: 30,
                                      width: 55,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Text('No'),
                            SizedBox(
                              width: 7,
                            ),
                            Flexible(
                              child: Text(
                                data.data()['name'].toString().capitalize(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                            ),
                            //Flexible(fit: FlexFit.tight, child: SizedBox()),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 2, 15, 5),
                          child: Wrap(
                            children: [
                              Text(
                                data.data()['title'].toString().capitalize(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 2, 15, 5),
                          child: Wrap(
                            children: [
                              Text(
                                data.data()['desc'].toString().capitalize(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(children: card),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LikeButton(
                                    //isLiked:model.isBusy ? false : model.dataReady,
                                    onTap: onLikeButtonTapped,
                                    // key: _globalKey,
                                    // onTap: (isLiked) {
                                    //   if (isLiked == null) {
                                    //     isLiked = true;
                                    //     mod.addLikes(data.id);
                                    //   } else {
                                    //     isLiked = true;
                                    //     print("No");
                                    //   }
                                    //   //return isLiked;
                                    // },
                                    size: 35,
                                    circleColor: CircleColor(
                                        start: Color(0xff00ddff),
                                        end: Color(0xff0099cc)),
                                    bubblesColor: BubblesColor(
                                      dotPrimaryColor: Color(0xff33b5e5),
                                      dotSecondaryColor: Color(0xff0099cc),
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        CupertinoIcons.heart_fill,
                                        color: isLiked
                                            ? Colors.deepPurpleAccent
                                            : Colors.black,
                                        size: 35,
                                      );
                                      /*CupertinoIcon(
                                        Icons.favorite,
                                        color: isLiked
                                            ? Colors.deepPurpleAccent
                                            : Colors.black,
                                        size: 35,
                                      );*/
                                    },
                                    //likeCount:int.parse(data.data()['likeCount'].toString()),
                                    countBuilder:
                                        (int count, bool isLiked, String text) {
                                      var color = isLiked
                                          ? Colors.deepPurpleAccent
                                          : Colors.grey;
                                      Widget result;
                                      if (count == 0) {
                                        result = Text(
                                          " 0 ",
                                          style: TextStyle(
                                              color: color,
                                              fontWeight: FontWeight.w700),
                                        );
                                      } else
                                        result = Text(
                                          text.toString(),
                                          style: TextStyle(
                                              color: color,
                                              fontWeight: FontWeight.w700),
                                        );

                                      return result;
                                    },
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print("yttttsss" +
                                          model.dataReady.toString());
                                      //model.addLikes(data.id);
                                      model.fetchExist(data.id);
                                    },
                                    child: Text(
                                      data.data()['likeCount'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      /////////////

                                      model.showCuper(
                                          context,
                                          data.id,
                                          data.data()['title'] +
                                              "," +
                                              data.data()['desc']);
                                      //model.showDialog();
                                      print("report");
                                    },
                                    child: SvgPicture.asset(
                                      'assets/report.svg',
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print('message');
                                    },
                                    child:
                                        SvgPicture.asset('assets/feedback.svg'),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  )
                                ],
                              ),
                              //   child: LikeButton(
                              //     //onTap: onLikeButtonTapped,
                              //     // key: _globalKey,
                              //     // onTap: (isLiked) {
                              //     //   if (isLiked == null) {
                              //     //     isLiked = true;
                              //     //     mod.addLikes(data.id);
                              //     //   } else {
                              //     //     isLiked = true;
                              //     //     print("No");
                              //     //   }
                              //     //   //return isLiked;
                              //     // },
                              //     size: 40,
                              //     circleColor: CircleColor(
                              //         start: Color(0xff00ddff),
                              //         end: Color(0xff0099cc)),
                              //     bubblesColor: BubblesColor(
                              //       dotPrimaryColor: Color(0xff33b5e5),
                              //       dotSecondaryColor: Color(0xff0099cc),
                              //     ),
                              //     likeBuilder: (bool isLiked) {
                              //       return Icon(
                              //         Icons.favorite,
                              //         color: isLiked
                              //             ? Colors.deepPurpleAccent
                              //             : Colors.black,
                              //         size: 40,
                              //       );
                              //     },
                              //     likeCount:
                              //         int.parse(data.data()['likeCount'].toString()),
                              //     countBuilder:
                              //         (int count, bool isLiked, String text) {
                              //       var color = isLiked
                              //           ? Colors.deepPurpleAccent
                              //           : Colors.grey;
                              //       Widget result;
                              //       if (count == 0) {
                              //         result = Text(
                              //           " 0 ",
                              //           style: TextStyle(
                              //               color: color,
                              //               fontWeight: FontWeight.w700),
                              //         );
                              //       } else
                              //         result = Text(
                              //           text.toString(),
                              //           style: TextStyle(
                              //               color: color,
                              //               fontWeight: FontWeight.w700),
                              //         );

                              //       return result;
                              //     },
                              //   ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // GestureDetector(
          //     onTap: () {
          //       Future.delayed(Duration(milliseconds: 1000)).then((value) {
          //         setState(() {
          //           Visible = !Visible;
          //         });
          //       });
          //     },
          //     child: Visibility(visible: Visible, child: LikeButton()))
        ],
      ),
      viewModelBuilder: () => PaginationModel(),
    );
  }
}
