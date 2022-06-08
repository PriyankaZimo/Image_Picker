class UpdateProfileModel {
  int? code;
  String? message;

  UpdateProfileModel({this.code, this.message});

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileModel(code: json['code'], message: json['message']);
}
