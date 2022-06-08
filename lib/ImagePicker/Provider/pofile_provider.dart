import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../Model/image_model.dart';
import '../../Model/profile_data_model.dart';
import '../../Model/update_profile_model.dart';
import '../../Provider/service.dart';
import '../../util.dart';

class ProfileProvider extends ChangeNotifier {
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var emailController = TextEditingController();
  var numberConroller = TextEditingController();
  ProfileDataModel profileDataModel = ProfileDataModel();
  late BuildContext context;
  var imagePath = '', imgPath = '';
  UpdateProfileModel updateProfileModel = UpdateProfileModel();
  ImageModel imageModel = ImageModel();
  bool _loading = false;
  bool imageLoad = false;

  bool get loading => _loading;
  var emailNameController = TextEditingController();
  var pNumberNameController = TextEditingController();

  Future<void> getProfileData(Map<String, dynamic> map) async {
    setLoading(true);
    notifyListeners();
    try {
      profileDataModel = await hitProfileData(map);
      setLoading(false);
      setValue(profileDataModel);
      notifyListeners();
    } on Exception catch (e) {
      setLoading(false);
      var message = e.toString().replaceAll('Exception', '');
      showMessage(message);
      print(e.toString());
    }
  }

  Future<void> updateProfileData(Map<String, dynamic> map) async {
    setLoading(true);
    notifyListeners();
    try {
      updateProfileModel = await hitUpdateProfile(map);
      setLoading(false);
      notifyListeners();
    } on Exception catch (e) {
      setLoading(false);
      var message = e.toString().replaceAll('Exception', '');
      showMessage(message);
      print(e.toString());
      notifyListeners();
    }
  }

  showMessage(String msg) {
    final snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void setLoading(bool bool) {
    _loading = bool;
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  /// upload image
  loadImage(File image) async {
    imageLoad = true;
    print(image);
    notifyListeners();
    try {
      var postUri = Uri.parse(BASE_URL + 'api/v1/doctor/uploadImage');
      var request = http.MultipartRequest("POST", postUri);
      request.fields.addAll({"type": "PROFILE"});
      request.files.add(
        http.MultipartFile(
          'file',
          image.readAsBytes().asStream(),
          image.lengthSync(),
          filename: image.path.split('/').last,
          contentType: new MediaType('image', 'jpeg'),
        ),
      );
      await request.send().then((response) {
        print(response.statusCode);
        if (response.statusCode == 200) {
          response.stream.transform(utf8.decoder).listen((value) {
            var parseData = json.decode(value);
            print('Response body: ${parseData}');
            if (parseData['code'] != 200)
              showMessage(parseData['message']);
            else {
              ImageModel imageModel = ImageModel.fromJson(parseData);
              imagePath = BASE_IMG_URL + imageModel.data!.imagePath.toString();
              imgPath = imageModel.data!.imagePath!;
            }
          });
        }

        imageLoad = false;
        notifyListeners();
      });
    } on SocketException {
      showMessage('Network Issue !!');
      imageLoad = false;
      notifyListeners();
    }
  }

  void setValue(ProfileDataModel profileDataModel) {}
}
