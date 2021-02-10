import 'package:flutter/material.dart';
import 'package:productivityApp/models/register_model.dart';
import 'package:productivityApp/screens/authWapper.dart';
import 'package:productivityApp/utils/services/local_storage_service.dart';
import 'package:productivityApp/utils/services/rest_api_service.dart';
import 'package:productivityApp/utils/ui/colorguide.dart';
import 'package:productivityApp/utils/ui/styleguide.dart';
import 'package:productivityApp/widgets/CustomButtons.dart';
import 'package:productivityApp/widgets/FormFields.dart';
import 'package:productivityApp/widgets/ProgressHUD.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  const Register({Key key, this.toggleView}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isApiCallProcess = false;
  RegisterRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new RegisterRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      key: scaffoldKey,
      backgroundColor: lightColor,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: RichText(
                    text: TextSpan(
                        text: "Create your account ",
                        style: TextStyle(
                          color: darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 48.0,
                          letterSpacing: 0.25,
                          height: 0.7,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ".",
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 80.0,
                            ),
                          ),
                        ]),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: UserNameFormField(
                    hintText: "Username",
                    onSaved: (val) => requestModel.username = val,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: EmailFormField(
                    hintText: "Email Address",
                    onSaved: (val) => requestModel.email = val,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: PasswordFormField(
                    hintText: "Password",
                    onSaved: (val) => requestModel.password = val,
                    validator: (val) => val.length < 8
                        ? 'Password should be atleast 8 character'
                        : null,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: PasswordFormField(
                    hintText: "Confirm Password",
                    // onSaved: () {},
                    // validator: (val) => val != password
                    //     ? "Password doesn't match"
                    //     : null,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: RoundedActionBtn(
                    size: MediaQuery.of(context).size.width,
                    text: 'REGISTER',
                    onPressed: () {
                      if (validateAndSave()) {
                        setState(() {
                          isApiCallProcess = true;
                        });
                        AuthService authService = new AuthService();
                        authService.register(requestModel).then((value) {
                          print(value.token);
                          if (value != null) {
                            setState(() {
                              isApiCallProcess = false;
                            });
                            if (value.token.isNotEmpty) {
                              print("hol");
                              addStringToSF("authKey", value.token);
                              final snackBar = SnackBar(
                                  content: Text("Registered Successful"));
                              scaffoldKey.currentState.showSnackBar(snackBar);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthWrapper(
                                    authKey: value.token,
                                    logOut: false,
                                  ),
                                ),
                                (Route<dynamic> route) => route is AuthWrapper,
                              );
                            } else {
                              print("paranai");

                              final snackBar =
                                  SnackBar(content: Text(value.error));
                              scaffoldKey.currentState.showSnackBar(snackBar);
                            }
                          }
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: GestureDetector(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: subtitleDark2,
                        children: <TextSpan>[
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: widget.toggleView,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
