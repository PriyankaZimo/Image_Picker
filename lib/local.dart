import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData(String email, String id, String firstName,
    String lastName, String image, ) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
  prefs.setString('uId', id);
  prefs.setString('firstName', firstName);
  prefs.setString('lastName', lastName);
  prefs.setString('image', image);
}
clearLocalData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  print('logout');
}

Future<String?> getUserID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('uId');
}
getImage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('image');
}
setImage(String image) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('image',image);
}

getFname() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('firstName');
}

getLname() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('lastName');
}

setFname(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('firstName', name);
}

setLname(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString('lastName', name);
}