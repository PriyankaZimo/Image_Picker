import 'package:flutter/material.dart';
import 'package:login_project/ImagePicker/profile_page.dart';
import 'package:login_project/Model/ems_model.dart';
import 'package:login_project/Model/login_model.dart';
import 'package:login_project/Provider/service.dart';
import 'package:login_project/local.dart';

class LoginProvider extends ChangeNotifier {
  late LoginModel loginModel;
  late EmsModel model;
  var image = '', name = '';
  bool load = false;
  String message = '';
  late BuildContext context;
  bool hidePassword = true;

  void hidePass() {
    hidePassword = !hidePassword;
    notifyListeners();
  }
  void setContext(BuildContext context) {
    this.context = context;
  }

// theratap@yopmail.com
  // Future<void> apiHit(String email, String pass) async {
  //   load = true;
  //   notifyListeners();
  //   var url = Uri.parse("https://theratap.com:1337/api/v1/user/login");
  //   var response =
  //       await http.post(url, body: {'email': email, 'password': pass});
  //   if (response.statusCode == 200) {
  //     print(response.statusCode);
  //     print(json.decode(response.body));
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Invalid Cradentials')));
  //     print(response.statusCode);
  //   }
  //
  //   notifyListeners();
  //   loginModel = LoginModel.fromJson(jsonDecode(response.body));
  //   load = false;
  //
  //   /// log check model data
  //   log(response.body);
  //   notifyListeners();
  // }
  Future<void> loginApi(Map<String, String> map) async {
    print(map);
    load = true;

    notifyListeners();
    try {
      loginModel = await hitLogin(map);
      showMessage(loginModel.message!);
      saveData(
        loginModel.data!.userInfo.email!,
        loginModel.data!.userInfo.id!,
        loginModel.data!.userInfo.firstName!,
        loginModel.data!.userInfo.lastName!,
        loginModel.data!.userInfo.image!,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfilePage()));

      load = false;
      notifyListeners();
    } on Exception catch (e) {
      message = e.toString().replaceAll('Exception', '');
      showMessage(message);
      print(e.toString());
      load = false;
      notifyListeners();
    }
  }

  void showMessage(String message) {
    SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  getUserData() async {
    var fName = await getFname();
    var lName = await getLname();
    image = await getImage();
    name = '$fName $lName';
    notifyListeners();
  }
}
