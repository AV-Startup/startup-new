import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/ui/shared/ui_helpers.dart';
import 'package:sprinkle/ui/Widget/busy.dart';
import 'package:sprinkle/ui/widget/Expansion.dart';
import 'package:sprinkle/ui/widget/input_field.dart';
import 'package:stacked/stacked.dart';
import 'sign_up_view_model.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final fullNameController = TextEditingController();

  final _country = TextEditingController(text: 'AO');

  final _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      // viewModel: SignUpViewModel(),
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
                verticalSpaceLarge,
                InputField(
                  placeholder: 'Full Name',
                  controller: fullNameController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Email',
                  controller: emailController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Password',
                  password: true,
                  controller: passwordController,
                  additionalNote:
                      'Password has to be a minimum of 6 characters.',
                ),
                Container(
                  color: Colors.transparent,
                  width: 320,
                  height: 50,
                  child: CupertinoTextField(
                    // cursorColor: Colors.amber,
                    controller: _phone,
                    //obscureText: true,
                    placeholder: "Enter PhoneNumber",
                  ),
                ),
                // SizedBox(
                //   height: 18,
                // ),
                // CupertinoButton(child: Text('Forgot Password'), onPressed: () {}),
                SizedBox(
                  height: 22,
                ),
                Wrap(children: [
                  Container(
                    height: 60,
                    width: 350,
                    child: FittedBox(
                      child: CountryListPick(
                          appBar: AppBar(
                            backgroundColor: Colors.blue,
                            title: Text('Country'),
                          ),
                          theme: CountryTheme(
                            isShowFlag: true,
                            isShowTitle: true,
                            isShowCode: true,
                            isDownIcon: true,
                            showEnglishName: true,
                          ),
                          // Set default value
                          initialSelection: '+91',
                          // or
                          // initialSelection: 'US'
                          onChanged: (CountryCode code) {
                            //setState(() {
                            _country.text = code.code;
                            // });
                            //_country.text = code.name;
                            print(code.name);
                            print(code.code);
                            print(code.dialCode);
                            print(code.flagUri);
                          },
                          // Whether to allow the widget to set a custom UI overlay
                          useUiOverlay: true,
                          // Whether the country list should be wrapped in a SafeArea
                          useSafeArea: false),
                    ),
                  ),
                  //FittedBox(child: Text(_country.text.toString())),
                ]),
                SizedBox(
                  height: 22,
                ),
                verticalSpaceSmall,
                ExpansionList<String>(
                    items: ['Investor', 'Developer', 'Marketing', 'Founder'],
                    title: model.selectedRole,
                    onItemSelected: model.setSelectedRole),
                verticalSpaceMedium,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BusyButton(
                      title: 'Sign Up',
                      busy: model.isBusy,
                      onPressed: () {
                        model.signUp(
                          email: emailController.text,
                          password: passwordController.text,
                          fullName: fullNameController.text,
                          countryCode: _country.text,
                          phone: _phone.text,
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
