import 'dart:convert';

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  ImageModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.fullPath,
    this.imagePath,
  });

  String? fullPath;
  String? imagePath;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    fullPath: json["fullPath"],
    imagePath: json["imagePath"]??json['db_name'],
  );

  Map<String, dynamic> toJson() => {
    "fullPath": fullPath,
    "imagePath": imagePath,
  };
}
