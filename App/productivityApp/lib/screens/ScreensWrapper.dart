import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productivityApp/models/user_model.dart';
import 'package:productivityApp/screens/Activity/Activity.dart';
import 'package:productivityApp/screens/Home/Home.dart';
import 'package:productivityApp/utils/services/rest_api_service.dart';
import 'package:productivityApp/utils/ui/colorguide.dart';

class ScreensWrapper extends StatefulWidget {
  final String authKey;
  const ScreensWrapper({Key key, this.authKey}) : super(key: key);
  @override
  _ScreensWrapperState createState() => _ScreensWrapperState();
}

class _ScreensWrapperState extends State<ScreensWrapper> {
  Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    AuthService authService = new AuthService();
    futureUser = authService.authorize(widget.authKey);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: new Scaffold(
          body: TabBarView(
            children: [
              FutureBuilder<User>(
                future: futureUser,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Home(
                      user: snapshot.data,
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              new Container(
                color: Colors.orange,
              ),
              new Container(
                color: Colors.lightGreen,
              ),
              Activity(),
              new Container(
                color: Colors.purple,
              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(FontAwesomeIcons.home),
              ),
              Tab(
                icon: new Icon(FontAwesomeIcons.calendarAlt),
              ),
              Tab(
                icon: new Icon(
                  FontAwesomeIcons.plus,
                  color: blueAccent,
                ),
              ),
              Tab(
                icon: new Icon(FontAwesomeIcons.chartLine),
              ),
              Tab(
                icon: new Icon(FontAwesomeIcons.cog),
              )
            ],
            labelColor: primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: primaryColor,
          ),
          backgroundColor: lightColor,
        ));
  }
}
