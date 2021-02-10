import 'package:shared_preferences/shared_preferences.dart';

addStringToSF(String sfKey, String skValue) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(sfKey, skValue);
}

getStringValuesSF(String sfKey) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String stringValue = prefs.getString(sfKey);
  return stringValue;
}

removeValues(String sfKey) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(sfKey);
}
