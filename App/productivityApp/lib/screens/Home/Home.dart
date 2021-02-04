import 'package:flutter/material.dart';
import 'package:productivityApp/utils/ui/styleguide.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
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
                            'Hi, Jane',
                            style: whiteHeadingBold,
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
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            Icons.person,
                            color: Colors.white,
                          )
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
                        style: whiteHeadingBold,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )
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
