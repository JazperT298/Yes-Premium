import 'dart:convert';

List<LoginData> loginFromJson(String str) =>
    List<LoginData>.from(json.decode(str).map((x) => LoginData.fromJson(x)));

String loginToJson(List<LoginData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginData {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? userName;
  String? issued;
  String? expires;

  LoginData(
      {this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.userName,
      this.issued,
      this.expires});

  LoginData.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    userName = json['userName'];
    issued = json['.issued'];
    expires = json['.expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['userName'] = this.userName;
    data['.issued'] = this.issued;
    data['.expires'] = this.expires;
    return data;
  }
}
