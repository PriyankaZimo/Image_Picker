class ProfileDataModel {
  int? code;
  String? message;

  ProfileDataModel({this.code, this.message});

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      ProfileDataModel(code: json['code'], message: json['message']);
}
