
import 'dart:convert';
LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String ?message;
  Data?data;

  factory LoginModel.fromJson(Map<String,dynamic> json) => LoginModel(
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
    required this.token,
    required this.userInfo,
  });

  String token;
  UserInfo userInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    userInfo: UserInfo.fromJson(json["userInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "userInfo": userInfo.toJson(),
  };
}

class UserInfo {
  UserInfo({
    this.firstName,
    this.lastName,
    this.city,
    this.mobileNo,
    this.isActive,
    this.isDeleted,
    this.isAccepted,
    this.address,
    this.postalCode,
    this.image,
    this.dateOfBirth,
    this.resetkey,
    this.state,
    this.country,
    this.id,
    this.gender,
    this.timeZone,
    this.token,
    this.deviceType,
    this.deviceId,
    this.email,
    this.invitedbyId,
    this.roleId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.permission,
  });

  String?firstName;
  String ?lastName;
  dynamic city;
  String ?mobileNo;
  bool ?isActive;
  bool ?isDeleted;
  String ?isAccepted;
  dynamic address;
  dynamic postalCode;
  String ?image;
  dynamic dateOfBirth;
  String ?resetkey;
  dynamic state;
  dynamic country;
  String ?id;
  dynamic gender;
  dynamic timeZone;
  dynamic token;
  String ?deviceType;
  dynamic deviceId;
  String ?email;
  String ?invitedbyId;
  RoleId ?roleId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int ?v;
  List<dynamic>? permission;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    firstName: json["firstName"],
    lastName: json["lastName"],
    city: json["city"],
    mobileNo: json["mobile_no"],
    isActive: json["isActive"],
    isDeleted: json["isDeleted"],
    isAccepted: json["isAccepted"],
    address: json["address"],
    postalCode: json["postal_code"],
    image: json["image"],
    dateOfBirth: json["date_of_birth"],
    resetkey: json["resetkey"],
    state: json["state"],
    country: json["country"],
    id: json["_id"],
    gender: json["gender"],
    timeZone: json["time_zone"],
    token: json["token"],
    deviceType: json["device_type"],
    deviceId: json["device_id"],
    email: json["email"],
    invitedbyId: json["invitedby_id"],
    roleId: RoleId.fromJson(json["role_id"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    permission: List<dynamic>.from(json["permission"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "city": city,
    "mobile_no": mobileNo,
    "isActive": isActive,
    "isDeleted": isDeleted,
    "isAccepted": isAccepted,
    "address": address,
    "postal_code": postalCode,
    "image": image,
    "date_of_birth": dateOfBirth,
    "resetkey": resetkey,
    "state": state,
    "country": country,
    "_id": id,
    "gender": gender,
    "time_zone": timeZone,
    "token": token,
    "device_type": deviceType,
    "device_id": deviceId,
    "email": email,
    "invitedby_id": invitedbyId,
    "role_id": roleId!.toJson(),
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
    "permission": List<dynamic>.from(permission!.map((x) => x)),
  };
}

class RoleId {
  RoleId({
    this.roleTitle,
    this.roleName,
    this.isActive,
    this.isDeleted,
    this.id,
    this.createdbyId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String?roleTitle;
  String ?roleName;
  bool ?isActive;
  bool ?isDeleted;
  String? id;
  String ?createdbyId;
  DateTime? createdAt;
  DateTime ?updatedAt;
  int ?v;

  factory RoleId.fromJson(Map<String, dynamic> json) => RoleId(
    roleTitle: json["roleTitle"],
    roleName: json["roleName"],
    isActive: json["isActive"],
    isDeleted: json["isDeleted"],
    id: json["_id"],
    createdbyId: json["createdby_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "roleTitle": roleTitle,
    "roleName": roleName,
    "isActive": isActive,
    "isDeleted": isDeleted,
    "_id": id,
    "createdby_id": createdbyId,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}
