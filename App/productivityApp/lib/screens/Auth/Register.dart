import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productivityApp/utils/ui/colorguide.dart';
import 'package:productivityApp/utils/ui/styleguide.dart';
import 'package:productivityApp/widgets/CustomButtons.dart';
import 'package:productivityApp/widgets/FormFields.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // final _formKey = GlobalKey<FormState>();

// text field state
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  String error = "";

  getValues() {
    print(username);
    print(email);
    print(password);
    print(confirmPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: lightColor,
      body: Center(
        child: SingleChildScrollView(
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
                  onChanged: (val) => setState(() => username = val),
                ),
                margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: EmailFormField(
                  hintText: "Email Address",
                  onChanged: (val) => setState(() => email = val),
                ),
                margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: PasswordFormField(
                  hintText: "Password",
                  onChanged: (val) => setState(() => password = val),
                ),
                margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: PasswordFormField(
                  hintText: "Confirm Password",
                  onChanged: (val) => setState(() => confirmPassword = val),
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
                  onPressed: getValues,
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
                  onTap: getValues,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
