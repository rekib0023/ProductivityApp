import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productivityApp/utils/ui/text_input_guides.dart';

class EmailFormField extends StatelessWidget {
  final String hintText;
  final Function onSaved;

  const EmailFormField({Key key, this.hintText, this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: textInputDecoration.copyWith(
          hintText: hintText,
          prefixIcon: new Icon(
            FontAwesomeIcons.solidEnvelope,
            color: Color(0xFF060C2D),
            size: 18,
          ),
        ),
        onSaved: onSaved,
        validator: (val) =>
            !val.contains("@") ? 'Email id should be valid' : null,
      ),
    );
  }
}

class UserNameFormField extends StatelessWidget {
  final String hintText;
  final Function onSaved;

  const UserNameFormField({Key key, this.hintText, this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: textInputDecoration.copyWith(
          hintText: hintText,
          prefixIcon: new Icon(
            FontAwesomeIcons.userAlt,
            color: Color(0xFF060C2D),
            size: 18,
          ),
        ),
        onSaved: onSaved,
        validator: (val) => val.isEmpty ? 'Enter an username' : null,
      ),
    );
  }
}

class PasswordFormField extends StatefulWidget {
  final String hintText;
  final Function onSaved;
  final Function validator;
  // bool hidePassword = true;

  const PasswordFormField(
      {Key key, this.hintText, this.onSaved, this.validator})
      : super(key: key);

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: textInputDecoration.copyWith(
            hintText: widget.hintText,
            prefixIcon: new Icon(
              FontAwesomeIcons.key,
              color: Color(0xFF060C2D),
              size: 18,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              icon: hidePassword
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            )),
        onSaved: widget.onSaved,
        obscureText: hidePassword,
        validator: widget.validator,
      ),
    );
  }
}
