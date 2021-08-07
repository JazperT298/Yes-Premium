class Announcement {
  List<Data>? data;
  String? message;
  String? status;

  Announcement({this.data, this.message, this.status});

  Announcement.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? announceID;
  String? announceSchoolID;
  String? announceDetails;
  String? announceFile;
  String? announceFileWidth;
  String? announceFileHeight;
  String? announceCreatedDate;
  String? announceFileExt;

  Data(
      {this.announceID,
      this.announceSchoolID,
      this.announceDetails,
      this.announceFile,
      this.announceFileWidth,
      this.announceFileHeight,
      this.announceCreatedDate,
      this.announceFileExt});

  Data.fromJson(Map<String, dynamic> json) {
    announceID = json['Announce_ID'];
    announceSchoolID = json['Announce_School_ID'];
    announceDetails = json['Announce_Details'];
    announceFile = json['Announce_File'];
    announceFileWidth = json['Announce_FileWidth'];
    announceFileHeight = json['Announce_FileHeight'];
    announceCreatedDate = json['Announce_CreatedDate'];
    announceFileExt = json['Announce_FileExt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Announce_ID'] = this.announceID;
    data['Announce_School_ID'] = this.announceSchoolID;
    data['Announce_Details'] = this.announceDetails;
    data['Announce_File'] = this.announceFile;
    data['Announce_FileWidth'] = this.announceFileWidth;
    data['Announce_FileHeight'] = this.announceFileHeight;
    data['Announce_CreatedDate'] = this.announceCreatedDate;
    data['Announce_FileExt'] = this.announceFileExt;
    return data;
  }
}
