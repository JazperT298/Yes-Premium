import 'dart:convert';
import 'dart:io';

class Notes {
  List<NotesData>? data;
  String? message;
  String? status;

  Notes({this.data, this.message, this.status});

  Notes.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <NotesData>[];
      json['Data'].forEach((v) {
        data!.add(new NotesData.fromJson(v));
      });
    }
    message = json['Message'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    data['Status'] = this.status;
    return data;
  }
}

NotesData notesdataFromJson(String str) => NotesData.fromJson(json.decode(str));

String notesdataToJson(NotesData data) => json.encode(data.toJson());

class NotesData {
  String? notesID;
  String? userID;
  String? schoolID;
  String? notesTitle;
  String? notesDesc;
  String? notesFileName;
  File? notesFile;
  String? notesFileExt;
  String? notesCreatedDate;

  NotesData(
      {this.notesID,
      this.userID,
      this.schoolID,
      this.notesTitle,
      this.notesDesc,
      this.notesFileName,
      this.notesFile,
      this.notesFileExt,
      this.notesCreatedDate});

  NotesData.fromJson(Map<String, dynamic> json) {
    notesID = json['Notes_ID'];
    userID = json['User_ID'];
    schoolID = json['School_ID'];
    notesTitle = json['Notes_Title'];
    notesDesc = json['Notes_Desc'];
    notesFileName = json['Notes_FileName'];
    notesFile = json['Notes_File'];
    notesFileExt = json['Notes_FileExt'];
    notesCreatedDate = json['Notes_CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Notes_ID'] = this.notesID;
    data['User_ID'] = this.userID;
    data['School_ID'] = this.schoolID;
    data['Notes_Title'] = this.notesTitle;
    data['Notes_Desc'] = this.notesDesc;
    data['Notes_FileName'] = this.notesFileName;
    data['Notes_File'] = this.notesFile;
    data['Notes_FileExt'] = this.notesFileExt;
    data['Notes_CreatedDate'] = this.notesCreatedDate;
    return data;
  }
}
