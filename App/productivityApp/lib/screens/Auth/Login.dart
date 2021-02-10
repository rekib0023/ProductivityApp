import 'package:flutter/material.dart';
import 'package:productivityApp/models/login_model.dart';
import 'package:productivityApp/screens/authWapper.dart';
import 'package:productivityApp/utils/services/local_storage_service.dart';
import 'package:productivityApp/utils/services/rest_api_service.dart';
import 'package:productivityApp/utils/ui/colorguide.dart';
import 'package:productivityApp/utils/ui/styleguide.dart';
import 'package:productivityApp/widgets/CustomButtons.dart';
import 'package:productivityApp/widgets/FormFields.dart';
import 'package:productivityApp/widgets/ProgressHUD.dart';

class Login extends StatefulWidget {
  final Function toggleView;

  const Login({Key key, this.toggleView}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isApiCallProcess = false;
  LoginRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
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
      key: scaffoldKey,
      // extendBodyBehindAppBar: true,
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
                        text: "Hello there, Welcome back ",
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
                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: RoundedActionBtn(
                      size: MediaQuery.of(context).size.width,
                      text: 'LOGIN',
                      onPressed: () {
                        if (validateAndSave()) {
                          setState(() {
                            isApiCallProcess = true;
                          });
                          AuthService authService = new AuthService();
                          authService.login(requestModel).then((value) {
                            if (value != null) {
                              setState(() {
                                isApiCallProcess = false;
                              });
                              if (value.token.isNotEmpty) {
                                addStringToSF("authKey", value.token);
                                final snackBar =
                                    SnackBar(content: Text("Login Successful"));
                                scaffoldKey.currentState.showSnackBar(snackBar);
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AuthWrapper(
                                      authKey: value.token,
                                      logOut: false,
                                    ),
                                  ),
                                  (Route<dynamic> route) =>
                                      route is AuthWrapper,
                                );
                              } else {
                                final snackBar =
                                    SnackBar(content: Text(value.error));
                                scaffoldKey.currentState.showSnackBar(snackBar);
                              }
                            }
                          });
                        }
                      }),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: GestureDetector(
                    child: RichText(
                      text: TextSpan(
                        text: "Need an account? ",
                        style: subtitleDark2,
                        children: <TextSpan>[
                          TextSpan(
                            text: "Register",
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
