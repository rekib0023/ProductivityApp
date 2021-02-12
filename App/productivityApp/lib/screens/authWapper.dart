import 'package:flutter/material.dart';
import 'package:productivityApp/models/authorize_model.dart';
import 'package:productivityApp/models/user_model.dart';
import 'package:productivityApp/screens/Auth/AuthPageWrapper.dart';
import 'package:productivityApp/screens/ScreensWrapper.dart';
import 'package:productivityApp/utils/services/local_storage_service.dart';
import 'package:productivityApp/utils/services/rest_api_service.dart';

class AuthWrapper extends StatefulWidget {
  final String authKey;
  final bool logOut;

  const AuthWrapper({Key key, this.authKey, this.logOut}) : super(key: key);
  @override
  _AuthWrapperState createState() => _AuthWrapperState(authKey);
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool isAuthenticate = false;
  String authKey;
  dynamic user;
  _AuthWrapperState(this.authKey);

  @override
  void initState() {
    super.initState();
    // user = new UserModel();
    if (authKey == null) {
      getStringValuesSF("authKey").then((value) {
        setState(() => authKey = value);
      });
    }
    AuthRequestModel authRequestModel = new AuthRequestModel(authKey: authKey);

    AuthService authService = new AuthService();
    authService.authorize(authRequestModel).then((value) {
      if (value != null) {
        setState(() {
          isAuthenticate = false;
        });
        if (value.user.isNotEmpty) {
          setState(() {
            isAuthenticate = true;
            user = value.user;
            // addStringToSF
            // user.user_authKey = value.user['authkey'];
            // user.user_name = value.user['username'];
            // user.user_email = value.user['email'];
            // user.user_creationDate = value.user['creationDate'];
          });
          print(user);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isAuthenticate && !widget.logOut
        ? ScreensWrapper(
            user: user,
          )
        : AuthPageWrapper();
  }
}
