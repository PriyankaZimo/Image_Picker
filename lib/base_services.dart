import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_project/util.dart';
baseServicePost(String url, Map<String, dynamic> map) async {
  var res = await http
      .post(Uri.parse(BASE_URL + url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(map))
      .timeout(Duration(seconds: 40));
  return res;
}
