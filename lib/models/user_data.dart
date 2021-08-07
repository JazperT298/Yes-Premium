import 'dart:convert';

class UserData {
  Data? data;
  String? message;
  String? status;

  UserData({this.data, this.message, this.status});

  UserData.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    message = json['Message'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Message'] = this.message;
    data['Status'] = this.status;
    return data;
  }
}

List<Data> dataFromJson(String str) =>
    List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String dataToJson(List<Data> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Data {
  String? userId;
  String? school;
  String? schoolId;
  String? schoolAvatar;
  String? username;
  String? avatar;
  String? roles;

  Data(
      {this.userId,
      this.school,
      this.schoolId,
      this.schoolAvatar,
      this.username,
      this.avatar,
      this.roles});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    school = json['School'];
    schoolId = json['SchoolId'];
    schoolAvatar = json['SchoolAvatar'];
    username = json['Username'];
    avatar = json['Avatar'];
    roles = json['Roles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['School'] = this.school;
    data['SchoolId'] = this.schoolId;
    data['SchoolAvatar'] = this.schoolAvatar;
    data['Username'] = this.username;
    data['Avatar'] = this.avatar;
    data['Roles'] = this.roles;
    return data;
  }
}
