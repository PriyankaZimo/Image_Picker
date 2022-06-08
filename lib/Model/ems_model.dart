import 'dart:convert';

class EmsModel {
  int? code;
  String? message;

  EmsModel({this.code, this.message});

  factory EmsModel.fromJson(Map<String, dynamic> map) =>
      EmsModel(code: map['code'], message: map['message']);
}
