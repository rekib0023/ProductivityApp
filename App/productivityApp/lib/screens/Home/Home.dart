import 'package:flutter/material.dart';
import 'package:productivityApp/models/user_model.dart';
import 'package:productivityApp/screens/authWapper.dart';
import 'package:productivityApp/utils/services/local_storage_service.dart';
import 'package:productivityApp/utils/ui/styleguide.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productivityApp/utils/ui/colorguide.dart';

class Home extends StatefulWidget {
  final User user;
  const Home({Key key, this.user}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: primaryGradient,
            ),
            padding: EdgeInsets.all(16),
            child: SafeArea(
              top: true,
              left: false,
              bottom: true,
              right: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // name + target count + notification + avatar
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // name with target count
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, ' + widget.user.name,
                            style: mainHeadingLight,
                          ),
                          Text(
                            'You have 5 targets',
                            style: whiteSubtitle,
                          ),
                        ],
                      ),
                      // notification bell with avatar
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.solidBell,
                            color: lightColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.userAlt,
                              color: lightColor,
                            ),
                            onPressed: () {
                              removeValues("authKey");
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthWrapper(),
                                ),
                                (Route<dynamic> route) => route is AuthWrapper,
                              );
                            },
                          )
                          // Icon(
                          //   FontAwesomeIcons.userAlt,
                          //   color: lightColor,
                          // )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your targets',
                        style: mainHeadingLight,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: lightColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
