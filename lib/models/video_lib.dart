import 'dart:convert';

class VideoLib {
  List<VideoLibData>? data;
  String? message;
  String? status;

  VideoLib({this.data, this.message, this.status});

  VideoLib.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <VideoLibData>[];
      json['Data'].forEach((v) {
        data!.add(new VideoLibData.fromJson(v));
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

VideoLibData videolibdataFromJson(String str) =>
    VideoLibData.fromJson(json.decode(str));

String videolibdataToJson(VideoLibData data) => json.encode(data.toJson());

class VideoLibData {
  String? videoLibID;
  String? schoolID;
  String? videoLibTitle;
  String? videoLibDetails;
  String? videoLibFileName;
  String? videoLibFileExt;
  String? videoLibCreatedDate;

  VideoLibData(
      {this.videoLibID,
      this.schoolID,
      this.videoLibTitle,
      this.videoLibDetails,
      this.videoLibFileName,
      this.videoLibFileExt,
      this.videoLibCreatedDate});

  VideoLibData.fromJson(Map<String, dynamic> json) {
    videoLibID = json['VideoLib_ID'];
    schoolID = json['School_ID'];
    videoLibTitle = json['VideoLib_Title'];
    videoLibDetails = json['VideoLib_Details'];
    videoLibFileName = json['VideoLib_FileName'];
    videoLibFileExt = json['VideoLib_FileExt'];
    videoLibCreatedDate = json['VideoLib_CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VideoLib_ID'] = this.videoLibID;
    data['School_ID'] = this.schoolID;
    data['VideoLib_Title'] = this.videoLibTitle;
    data['VideoLib_Details'] = this.videoLibDetails;
    data['VideoLib_FileName'] = this.videoLibFileName;
    data['VideoLib_FileExt'] = this.videoLibFileExt;
    data['VideoLib_CreatedDate'] = this.videoLibCreatedDate;
    return data;
  }
}
