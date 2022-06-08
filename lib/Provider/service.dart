import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:login_project/Model/ems_model.dart';
import 'package:login_project/Model/login_model.dart';
import 'package:login_project/Model/update_profile_model.dart';
import '../Model/profile_data_model.dart';
import '../base_services.dart';

/// Service
hitLogin(Map<String, dynamic> map) async {
  try {
    var res = await baseServicePost("api/v1/user/login", map);
    if (res.statusCode == 200) {
      log('login--->${res.body}');
      var parse = json.decode(res.body);
      if (parse['code'] == 200) {
        return LoginModel.fromJson(parse);
      } else {
        throw Exception(parse['message']);
      }
    }
  } on SocketException {
    throw Exception("Network Issue!!");
  }
}
hitUpdateProfile(Map<String, dynamic> map) async {
  try {
    var response = await baseServicePost('api/v1/user/editAdmin', map);
    if (response.statusCode == 200) {
      print('update body: ${response.body}');
      var parseData = json.decode(response.body);
      if (parseData['code'] != 200)
        throw Exception(parseData['message']);
      else
        return UpdateProfileModel.fromJson(parseData);
    }
  } on SocketException {
    throw Exception('Network Issue !!');
  }
}
hitProfileData(Map<String, dynamic> map) async {
  try {
    var response = await baseServicePost('api/v1/user/getAdminDetails', map);
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      var parseData = json.decode(response.body);
      if (parseData['code'] != 200)
        throw Exception(parseData['message']);
      else
        return ProfileDataModel.fromJson(parseData);
    }
  } on SocketException {
    throw Exception('Network Issue !!');
  }
}