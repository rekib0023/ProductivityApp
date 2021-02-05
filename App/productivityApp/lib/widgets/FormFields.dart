import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productivityApp/utils/ui/colorguide.dart';
import 'package:productivityApp/utils/ui/text_input_guides.dart';

// class UserFormField extends StatelessWidget {
//   final Function onChanged;

//   const UserFormField({Key key, this.onChanged}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: textInputDecoration.copyWith(labelText: 'Username'),
//       validator: (val) => val.isEmpty ? 'Enter an username' : null,
//       onChanged: onChanged,
//     );
//   }
// }

class EmailFormField extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  // final TextEditingController textEditingController;

  const EmailFormField({Key key, this.hintText, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: textInputDecoration.copyWith(
          hintText: hintText,
          prefixIcon: new Icon(
            FontAwesomeIcons.solidEnvelope,
            color: Color(0xFF060C2D),
            size: 18,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class UserNameFormField extends StatelessWidget {
  final String hintText;
  final Function onChanged;

  const UserNameFormField({Key key, this.hintText, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: textInputDecoration.copyWith(
          hintText: hintText,
          prefixIcon: new Icon(
            FontAwesomeIcons.userAlt,
            color: Color(0xFF060C2D),
            size: 18,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

class PasswordFormField extends StatelessWidget {
  final String hintText;
  final Function onChanged;

  const PasswordFormField({Key key, this.hintText, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: textInputDecoration.copyWith(
          hintText: hintText,
          prefixIcon: new Icon(
            FontAwesomeIcons.key,
            color: Color(0xFF060C2D),
            size: 18,
          ),
        ),
        onChanged: onChanged,
        obscureText: true,
      ),
    );
  }
}

// class UserNameFormField extends StatelessWidget {
//   // final Function onChanged;

//   // const EmailFormField({Key key, @required this.onChanged}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TextField(
//         decoration: textInputDecoration.copyWith(
//           hintText: 'Username',
//           icon: new Icon(
//             FontAwesomeIcons.user,
//             color: primaryColor,
//           ),
//         ),
//         // validator: (val) => val.isEmpty ? 'Enter an email!' : null,
//         // onChanged: onChanged,
//       ),
//     );
//   }
// }

// class PasswordFormField extends StatelessWidget {
//   final Function onChanged;
//   const PasswordFormField({Key key, @required this.onChanged})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: textInputDecoration.copyWith(
//           labelText: 'Password',
//           helperText: 'This has to be over 6 characters in length'),
//       validator: (val) => val.length < 6
//           ? 'Password must have more than six characters!'
//           : null,
//       obscureText: true,
//       onChanged: onChanged,
//     );
//   }
// }

// class NumberOnlyField extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//         keyboardType: TextInputType.number,
//         inputFormatters: <TextInputFormatter>[
//           WhitelistingTextInputFormatter.digitsOnly
//         ],
//         decoration: InputDecoration(
//           hintText: 'Set Number',
//         ));
//   }
// }
