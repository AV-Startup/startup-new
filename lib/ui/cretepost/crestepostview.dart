import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprinkle/model/post.dart';
import 'package:sprinkle/ui/cretepost/createpostviewmodel.dart';
import 'package:stacked/stacked.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey[900],
        textColor: Colors.white,
        fontSize: 16.0);
  }

  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  TextEditingController keywordController = TextEditingController();

  TextEditingController issController = TextEditingController();

  int titleLength = 0, descLenngth = 0, requirementslength = 0;

  List<String> keys = [];

  FocusNode focusNode = FocusNode();

  String type = "Public";

  @override
  Widget build(BuildContext context) {
    print('rebuildddddddddddd');
    return ViewModelBuilder<CreatePostViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CupertinoNavigationBar(
          middle: Text('Create Post'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  // Divider(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      focusNode: focusNode,
                      //autofocus: true,
                      //onEditingComplete: (() => focusNode.requestFocus()),
                      controller: titleController,
                      onChanged: model.onTitleChanged,
                      maxLengthEnforced: true,
                      maxLength: 50,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Valid Title';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          counterText: '',
                          border: OutlineInputBorder(),
                          labelText: 'Title'),
                    ),
                  ),
                  //Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${model.titleLength.toString()}/50",
                          style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  //Divider(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      // focusNode: focusNode,
                      controller: descController,
                      validator: (value) {
                        if (value.trim().length != 10) {
                          return 'Enter valid Description';
                        }
                        return null;
                      },
                      maxLengthEnforced: true,
                      maxLength: 50,
                      //keyboardType: TextInputType.number,
                      onChanged: model.onDescChanged,
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                      ),
                    ),
                  ),
                  //Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${model.selectedRole.toString()}/50",
                          style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  //Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 90,
                        width: 270,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                            controller: keywordController,
                            validator: (value) {
                              if (value.trim().length != 10) {
                                return 'Enter keywords';
                              }
                              return null;
                            },
                            maxLengthEnforced: true,
                            maxLength: 50,
                            //keyboardType: TextInputType.number,
                            //onChanged: model.onReqChanged,
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(),
                              labelText: 'KeyWords',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                          onPressed: () {
                            keys.add(keywordController.text);
                            keywordController.clear();
                          },
                          child: Text('Add'))
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  CupertinoButton(
                      color: Colors.blueGrey,
                      child: Text('Publish'),
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        //final timestamp = Timestamp.now();
                        final miilisincessinceepoch =
                            DateTime.now().millisecondsSinceEpoch;
                        final daysSinceEpoch =
                            miilisincessinceepoch ~/ 86400000;

                        DateTime dt = DateTime.now();

                        model
                            .submit(Posts(
                          publisherId: auth.currentUser.uid,
                          desc: descController.text,
                          title: titleController.text,
                          name: prefs.getString('name'),
                          flagCode: prefs.getString('countryCode'),
                          timestamp: dt.toString(),
                          epochs: daysSinceEpoch,
                          keywords: keys.join(","),
                          likeCount: 0,
                        ))
                            .then((value) {
                          showToast('Posted Successfully');
                        });
                        keywordController.clear();
                        descController.clear();
                        titleController.clear();
                        //model.submit(Posts());

                        // prefs = await SharedPreferences.getInstance();
                        // DateTime dt = DateTime.now();

                        // fs
                        //     .createPost(Post(
                        //   publisherId: auth.currentUser.uid,
                        //   desc: descController.text,
                        //   title: titleController.text,
                        //   flagCode: prefs.getString('countryCode'),
                        //   timestamp: dt.toString(),
                        //   epochs: '2000',
                        //   keywords: keys.join(","),
                        //   likeCount: '0',
                        // ))
                        //     .then((value) {
                        //   showToast('Posted Successfully');
                        // });
                        // keywordController.clear();
                        // descController.clear();
                        // titleController.clear();
                      }),
                ]),
              ),
            ),
          ]),
        ),
        //),);
      ),
      viewModelBuilder: () => CreatePostViewModel(),
    );
  }
}
/*
Container(
                    width: 370,
                    //decoration: BoxDecoration(
                    //border: Border.all(color: Colors.grey),
                    //color: Colors.black,
                    //borderRadius: BorderRadius.circular(6.0)),
                    //width: 350,
                    height: 80,
                    child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 250,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Set privacy'),
                                      Icon(
                                        Icons.arrow_drop_down_circle,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CupertinoActionSheet(
                                        title: const Text('Change Privacy'),
                                        message: const Text(
                                            'Choose the post privacy as public or private'),
                                        actions: [
                                          CupertinoActionSheetAction(
                                            child: const Text(
                                              'Public(All)',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.blueGrey),
                                            ),
                                            onPressed: () {
                                              // setState(() {
                                              //   type = "Public";
                                              // });
                                              Navigator.pop(context);
                                            },
                                          ),
                                          CupertinoActionSheetAction(
                                            child: const Text(
                                              'Private(Only You)',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.blueGrey),
                                            ),
                                            onPressed: () {
                                              // setState(() {
                                              //   type = "Private";
                                              // });
                                              //type = " private";
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ]),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    '$type',
                    style: TextStyle(
                        fontWeight: FontWeight.w800, color: Colors.black),
                  ),*/
