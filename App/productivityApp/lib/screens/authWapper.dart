import 'package:flutter/material.dart';
import 'package:productivityApp/screens/Auth/AuthPageWrapper.dart';
import 'package:productivityApp/screens/ScreensWrapper.dart';
import 'package:productivityApp/utils/services/local_storage_service.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key key}) : super(key: key);
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  Future<dynamic> authKey;

  @override
  void initState() {
    super.initState();
    authKey = getStringValuesSF("authKey");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: authKey,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ScreensWrapper(
            authKey: snapshot.data,
          );
        } else if (!snapshot.hasData) {
          return AuthPageWrapper();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
