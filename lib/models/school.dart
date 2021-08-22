import 'dart:convert';

class School {
  SchoolData? data;
  String? message;
  String? status;

  School({this.data, this.message, this.status});

  School.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new SchoolData.fromJson(json['Data']) : null;
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

// SchoolData schooldataFromJson(String str) =>
//     SchoolData.fromJson(json.decode(str));

// String schooldataToJson(SchoolData data) => json.encode(data.toJson());

List<SchoolData> schooldataFromJson(String str) =>
    List<SchoolData>.from(json.decode(str).map((x) => SchoolData.fromJson(x)));

String schooldataToJson(List<SchoolData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolData {
  String? schoolID;
  String? schoolName;
  String? schoolLogo;
  String? schoolAddress;
  String? schoolDetails;
  String? schoolCreated;
  String? schoolMotto;
  String? schoolAbbreviation;
  String? schoolCode;
  String? adminUsername;
  String? adminPassword;

  SchoolData(
      {this.schoolID,
      this.schoolName,
      this.schoolLogo,
      this.schoolAddress,
      this.schoolDetails,
      this.schoolCreated,
      this.schoolMotto,
      this.schoolAbbreviation,
      this.schoolCode,
      this.adminUsername,
      this.adminPassword});

  SchoolData.fromJson(Map<String, dynamic> json) {
    schoolID = json['School_ID'];
    schoolName = json['School_Name'];
    schoolLogo = json['School_Logo'];
    schoolAddress = json['School_Address'];
    schoolDetails = json['School_Details'];
    schoolCreated = json['School_Created'];
    schoolMotto = json['School_Motto'];
    schoolAbbreviation = json['School_Abbreviation'];
    schoolCode = json['School_Code'];
    adminUsername = json['Admin_Username'];
    adminPassword = json['Admin_Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['School_ID'] = this.schoolID;
    data['School_Name'] = this.schoolName;
    data['School_Logo'] = this.schoolLogo;
    data['School_Address'] = this.schoolAddress;
    data['School_Details'] = this.schoolDetails;
    data['School_Created'] = this.schoolCreated;
    data['School_Motto'] = this.schoolMotto;
    data['School_Abbreviation'] = this.schoolAbbreviation;
    data['School_Code'] = this.schoolCode;
    data['Admin_Username'] = this.adminUsername;
    data['Admin_Password'] = this.adminPassword;
    return data;
  }
}
