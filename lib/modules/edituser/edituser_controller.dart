import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/models/user_model.dart';
import 'package:yes_premium/modules/userprofile/userprofile_api.dart';

class EditUserController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<String> attachments1 = <String>[].obs;
  RxList<String> attachments2 = <String>[].obs;
  late String platformResponse;
  var userModelDetails = <UserModelData>[].obs;
  var userIDEditingController = TextEditingController();
  var firstnameEditingController = TextEditingController();
  var lastnameEditingController = TextEditingController();
  var middlenameEditingController = TextEditingController();
  var addressEditingController = TextEditingController();
  var emailEditingController = TextEditingController();
  var bithdayEditingController = TextEditingController();

  var parentfullnameEditingController = TextEditingController();
  var parentemailEditingController = TextEditingController();
  var parentcontactnoEditingController = TextEditingController();

  var educationalAttainmentEditingController = TextEditingController();
  var subjectmajorEditingController = TextEditingController();
  var positionEditingController = TextEditingController();
  var nicknameEditingController = TextEditingController();
  var dreamjobEditingController = TextEditingController();
  var yearEditingController = TextEditingController();

  var facebookEditingController = TextEditingController();
  var twitterEditingController = TextEditingController();
  var instagramEditingController = TextEditingController();
  var emailsEditingController = TextEditingController();
  var skypeEditingController = TextEditingController();
  var zoomEditingController = TextEditingController();

  var usernameEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();
  var confirmpasswordEditingController = TextEditingController();

  var userType = ''.obs;
  //var userID, userSchoolID, userCode, gender, userImage, userMotto;
  var userID = ''.obs;
  var userSchoolID = ''.obs;
  var userCode = ''.obs;
  var userGender = ''.obs;
  var userImage = ''.obs;
  var userCoverImage = ''.obs;
  var userMotto = ''.obs;
  File? profileImage;
  File? coverImage;

  var filenameimageprofile = "".obs;
  var fileTypeimageprofile = "".obs;
  var filenameimagecover = "".obs;
  var fileTypeimageCover = "".obs;
  var filenamewholeimge = "".obs;
  @override
  void onInit() {
    super.onInit();
    //isLoading.value = false;
    userID.value = Get.arguments['User_ID'];
    getUserDetailsById();
    // userSchoolID = Get.arguments['User_SchoolID'];
    // userCode = Get.arguments['User_Code'];
    // firstnameEditingController.text = Get.arguments['User_Firstname'];
    // lastnameEditingController.text = Get.arguments['User_Lastname'];
    // middlenameEditingController.text = Get.arguments['User_Middlename'];
    // addressEditingController.text = Get.arguments['User_Address'];
    // gender = Get.arguments['User_Gender'];
    // userImage = Get.arguments['User_Image'];
    // educationalAttainmentEditingController.text = Get.arguments['User_EducationalAttainment'];
    // subjectmajorEditingController.text = Get.arguments['User_SubjMajor'];
    // positionEditingController.text = Get.arguments['User_Position'];
    // facebookEditingController.text = Get.arguments['User_Facebook'];
    // twitterEditingController.text = Get.arguments['User_Twitter'];
    // instagramEditingController.text = Get.arguments['User_Instagram'];
    // emailEditingController.text = Get.arguments['User_Email'];
    // skypeEditingController.text = Get.arguments['User_Skype'];
    // zoomEditingController.text = Get.arguments['User_Zoom'];
    // userMotto = Get.arguments['User_Motto'];
    // nicknameEditingController.text = Get.arguments['User_Nickname'];
    // dreamjobEditingController.text = Get.arguments['User_Dreamjob'];
    // yearEditingController.text = Get.arguments['User_Year'];
    // userType.value = Get.arguments['User_Type'];
    // parentfullnameEditingController.text = Get.arguments['Parent_Fullname'];
    // parentemailEditingController.text = Get.arguments['Parent_Email'];
    // parentcontactnoEditingController.text = Get.arguments['Parent_ContactNumber'];
  }

  //Get customer details from server
  Future<void> getUserDetailsById() async {
    try {
      userModelDetails.value = await UserProfileApi.getUserDetailsById(userID.value);
      isLoading.value = true;
      //Assign values from server to variables
      userID.value = "${userModelDetails[0].userID}";
      userSchoolID.value = "${userModelDetails[0].userSchoolID}";
      userCode.value = "${userModelDetails[0].userCode}";
      firstnameEditingController.text = "${userModelDetails[0].userFirstname}";
      lastnameEditingController.text = "${userModelDetails[0].userLastname}";
      middlenameEditingController.text = "${userModelDetails[0].userMiddlename}";
      // userBirthday.value = "${userModelDetails[0].userBirthday}";
      addressEditingController.text = "${userModelDetails[0].userAddress}";
      userGender.value = "${userModelDetails[0].userGender}";
      userImage.value = "${userModelDetails[0].userImage}";
      userCoverImage.value = "${userModelDetails[0].userCoverImage}";
      educationalAttainmentEditingController.text = "${userModelDetails[0].userEducationalAttainment}";
      subjectmajorEditingController.text = "${userModelDetails[0].userSubjMajor}";
      positionEditingController.text = "${userModelDetails[0].userPosition}";
      facebookEditingController.text = "${userModelDetails[0].userFacebook}";
      twitterEditingController.text = "${userModelDetails[0].userTwitter}";
      instagramEditingController.text = "${userModelDetails[0].userInstagram}";
      emailEditingController.text = "${userModelDetails[0].userEmail}";
      skypeEditingController.text = "${userModelDetails[0].userSkype}";
      zoomEditingController.text = "${userModelDetails[0].userZoom}";
      userMotto.value = "${userModelDetails[0].userMotto}";
      nicknameEditingController.text = "${userModelDetails[0].userNickname}";
      dreamjobEditingController.text = "${userModelDetails[0].userDreamjob}";
      yearEditingController.text = "${userModelDetails[0].userYear}";
      userType.value = "${userModelDetails[0].userType}";
      usernameEditingController.text = "${userModelDetails[0].userName}";
      parentfullnameEditingController.text = "${userModelDetails[0].parentFullname}";
      parentemailEditingController.text = "${userModelDetails[0].parentEmail}";
      parentcontactnoEditingController.text = "${userModelDetails[0].parentContactNumber}";
      isLoading.value = false;
    } catch (error) {
      print("getUserDetailsById $error");
    } finally {
      isLoading(false);
    }
  }

  Future getProfileImage() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    print("FilePickerResult Response : ${pickedFile.toString()}");

    if (pickedFile != null) {
      File imgprofile = File(pickedFile.files.single.path!);
      attachments2.add(pickedFile.files.single.path!);
      print("Image $attachments1");
      try {
        profileImage = imgprofile;
        filenamewholeimge.value = imgprofile.path.split('/').last;
        var splitTheimage = filenamewholeimge.split('.');
        filenameimageprofile.value = splitTheimage[0];
        fileTypeimageprofile.value = splitTheimage[1];
        isLoading(false);
        update();
      } catch (e) {
        print("image path errror");
      }
    } else {}
  }

  Future getCoverImage() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    print("FilePickerResult Response : ${pickedFile.toString()}");

    if (pickedFile != null) {
      File imgprofile = File(pickedFile.files.single.path!);
      attachments1.add(pickedFile.files.single.path!);
      print("Image $attachments2");
      try {
        coverImage = imgprofile;
        filenamewholeimge.value = imgprofile.path.split('/').last;
        var splitTheimage = filenamewholeimge.split('.');
        filenameimagecover.value = splitTheimage[0];
        fileTypeimageCover.value = splitTheimage[1];
        isLoading(false);
        update();
      } catch (e) {
        print("image path errror");
      }
    } else {}
  }
}
