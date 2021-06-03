/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../ui/profile/profileviewmodel.dart';
//import 'editprofileviewmodel.dart';

// ignore: must_be_immutable
class EditPostView extends StatelessWidget {
  TextEditingController bio = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      //viewModel: LoginViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: CupertinoNavigationBar(
            middle: Text('Edit Profile'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
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
                    height: 15,
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
                    height: 18,
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
                          model.initialise();
                        });

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
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          )),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
*/
