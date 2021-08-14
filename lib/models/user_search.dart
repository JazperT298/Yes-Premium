import 'dart:convert';

UserSearch usersearchFromJson(String str) =>
    UserSearch.fromJson(json.decode(str));

String usersearchToJson(UserSearch data) => json.encode(data.toJson());

class UserSearch {
  String? userID;
  String? userSchoolID;
  String? userCode;
  String? userFirstname;
  String? userLastname;
  String? userMiddlename;
  String? userBirthday;
  String? userAddress;
  String? userGender;
  String? userImage;
  String? userCoverImage;
  String? userEducationalAttainment;
  String? userSubjMajor;
  String? userPosition;
  String? userFacebook;
  String? userTwitter;
  String? userInstagram;
  String? userEmail;
  String? userSkype;
  String? userZoom;
  String? userMotto;
  String? userNickname;
  String? userDreamjob;
  String? userYear;
  String? userType;
  String? userName;
  String? schoolName;
  String? schoolLogo;
  String? parentFullname;
  String? parentEmail;
  String? parentContactNumber;
  String? name;
  bool? lockoutEnabled;

  UserSearch(
      {this.userID,
      this.userSchoolID,
      this.userCode,
      this.userFirstname,
      this.userLastname,
      this.userMiddlename,
      this.userBirthday,
      this.userAddress,
      this.userGender,
      this.userImage,
      this.userCoverImage,
      this.userEducationalAttainment,
      this.userSubjMajor,
      this.userPosition,
      this.userFacebook,
      this.userTwitter,
      this.userInstagram,
      this.userEmail,
      this.userSkype,
      this.userZoom,
      this.userMotto,
      this.userNickname,
      this.userDreamjob,
      this.userYear,
      this.userType,
      this.userName,
      this.schoolName,
      this.schoolLogo,
      this.parentFullname,
      this.parentEmail,
      this.parentContactNumber,
      this.name,
      this.lockoutEnabled});

  UserSearch.fromJson(Map<String, dynamic> json) {
    userID = json['User_ID'];
    userSchoolID = json['User_SchoolID'];
    userCode = json['User_Code'];
    userFirstname = json['User_Firstname'];
    userLastname = json['User_Lastname'];
    userMiddlename = json['User_Middlename'];
    userBirthday = json['User_Birthday'];
    userAddress = json['User_Address'];
    userGender = json['User_Gender'];
    userImage = json['User_Image'];
    userCoverImage = json['User_CoverImage'];
    userEducationalAttainment = json['User_EducationalAttainment'];
    userSubjMajor = json['User_SubjMajor'];
    userPosition = json['User_Position'];
    userFacebook = json['User_Facebook'];
    userTwitter = json['User_Twitter'];
    userInstagram = json['User_Instagram'];
    userEmail = json['User_Email'];
    userSkype = json['User_Skype'];
    userZoom = json['User_Zoom'];
    userMotto = json['User_Motto'];
    userNickname = json['User_Nickname'];
    userDreamjob = json['User_Dreamjob'];
    userYear = json['User_Year'];
    userType = json['User_Type'];
    userName = json['UserName'];
    schoolName = json['School_Name'];
    schoolLogo = json['School_Logo'];
    parentFullname = json['Parent_Fullname'];
    parentEmail = json['Parent_Email'];
    parentContactNumber = json['Parent_ContactNumber'];
    name = json['Name'];
    lockoutEnabled = json['LockoutEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_ID'] = this.userID;
    data['User_SchoolID'] = this.userSchoolID;
    data['User_Code'] = this.userCode;
    data['User_Firstname'] = this.userFirstname;
    data['User_Lastname'] = this.userLastname;
    data['User_Middlename'] = this.userMiddlename;
    data['User_Birthday'] = this.userBirthday;
    data['User_Address'] = this.userAddress;
    data['User_Gender'] = this.userGender;
    data['User_Image'] = this.userImage;
    data['User_CoverImage'] = this.userCoverImage;
    data['User_EducationalAttainment'] = this.userEducationalAttainment;
    data['User_SubjMajor'] = this.userSubjMajor;
    data['User_Position'] = this.userPosition;
    data['User_Facebook'] = this.userFacebook;
    data['User_Twitter'] = this.userTwitter;
    data['User_Instagram'] = this.userInstagram;
    data['User_Email'] = this.userEmail;
    data['User_Skype'] = this.userSkype;
    data['User_Zoom'] = this.userZoom;
    data['User_Motto'] = this.userMotto;
    data['User_Nickname'] = this.userNickname;
    data['User_Dreamjob'] = this.userDreamjob;
    data['User_Year'] = this.userYear;
    data['User_Type'] = this.userType;
    data['UserName'] = this.userName;
    data['School_Name'] = this.schoolName;
    data['School_Logo'] = this.schoolLogo;
    data['Parent_Fullname'] = this.parentFullname;
    data['Parent_Email'] = this.parentEmail;
    data['Parent_ContactNumber'] = this.parentContactNumber;
    data['Name'] = this.name;
    data['LockoutEnabled'] = this.lockoutEnabled;
    return data;
  }
}
