import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/ui/profile/profileviewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'locator.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.floating: (context, sheetRequest, completer) =>
        _FloatingBoxBottomSheet(
          //newmodel: models,
          request: sheetRequest,
          completer: completer,
          //newmodel:,
        )
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}

enum BottomSheetType {
  floating,
}

class _FloatingBoxBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  //var newmodel;
  TextEditingController name = TextEditingController();
  TextEditingController bio = TextEditingController();

  _FloatingBoxBottomSheet({
    Key key,
    this.request,
    this.completer,
    // @required this.newmodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            margin: EdgeInsets.all(25),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 320,
                    height: 50,
                    child: CupertinoTextField(
                      //keyboardType: TextInputType.n,
                      controller: name,
                      //  decoration: BoxDecoration(
                      //border: Border.all(color: Colors.blueAccent)
                      //   contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      // hintText: "Password",
                      // border:
                      //     OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                      //   ),
                      maxLengthEnforced: true,
                      maxLength: 15,
                      placeholder: "Enter Name",
                      onChanged: model.onTitleChanged,
                      // (va) {
                      //   setState(() {
                      //     name.text;
                      //   });
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                          child: Text(model.titlelength.toString() + "/15"),
                          onPressed: () {}),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    child: CupertinoTextField(
                      maxLengthEnforced: true,
                      maxLength: 50,
                      controller: bio,
                      //obscureText: true,
                      placeholder: "Edit About",
                      onChanged: model.onDescChanged,
                      // (value) {
                      //   setState(() {
                      //     bio.text;
                      //   });
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                          child: Text(model.desclength.toString() + "/50"),
                          onPressed: () {}),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CupertinoButton(
                      color: Colors.blueGrey,
                      child: Text('OK'),
                      onPressed: () async {
                        if ((name.text.length == 0) || (bio.text.length == 0)) {
                          return;
                        }
                        model.update(name.text, bio.text);
                        Future.delayed(Duration(seconds: 2)).then((value) {
                          request.customData.initialise();
                          //model.setInitialised(value);
                          completer(SheetResponse(confirmed: true));
                        });
                        //completer(SheetResponse(confirmed: true));

                        // SharedPreferences prefs =
                        //     await SharedPreferences.getInstance();

                        // await users.doc(auth.currentUser.uid).update({
                        //   'name': name.text,
                        //   'about': bio.text,
                        // }).then((value) {
                        //   print("User Added");
                        //   prefs.setString('name', name.text);
                        //   prefs.setString('about', bio.text);
                        //   showToast('Updated Succcessfully');
                        // }).catchError((error) {
                        //   print("Failed to add user: $error");
                        //   showToast('Failed ');
                        // });
                        // setState(() {
                        //   name.clear();
                        //   bio.clear();
                        // });
                      }),
                  // Text(
                  //   request.title,
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.grey[900],
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  // Text(
                  //   request.description,
                  //   style: TextStyle(color: Colors.grey),
                  // ),
                  // Row(
                  //   mainAxisSize: MainAxisSize.max,
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  MaterialButton(
                    onPressed: () => completer(SheetResponse(confirmed: true)),
                    child: Text(
                      'Cancel',
                      //request.secondaryButtonTitle,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  // FlatButton(
                  //   onPressed: () =>
                  //       completer(SheetResponse(confirmed: true)),
                  //   child: Text(
                  //     request.mainButtonTitle,
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  //   color: Theme.of(context).primaryColor,
                  // )
                  //   ],
                  // )
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => ProfileViewModel());
  }
}
