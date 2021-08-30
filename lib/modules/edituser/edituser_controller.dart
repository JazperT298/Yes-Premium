import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/models/user_model.dart';
import 'package:yes_premium/modules/edituser/edituser_api.dart';
import 'package:yes_premium/modules/educatorlist/educatorlist_controller.dart';
import 'package:yes_premium/modules/studentlist/studentlist_controller.dart';
import 'package:yes_premium/modules/userprofile/userprofile_api.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';

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
  var gender;
  @override
  void onInit() {
    super.onInit();
    //isLoading.value = false;
    userID.value = Get.arguments['User_ID'];
    userType.value = Get.arguments['User_Type'];
    print('${userType.value}');
    getUserDetailsById();
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

  void checkEducatorInput(context) {
    if (passwordEditingController.text.isEmpty) {
      if (firstnameEditingController.text.trim().isEmpty) {
        Dialogs.showWarningToast(context, "Please input users firstname");
      } else if (lastnameEditingController.text.trim().isEmpty) {
        Dialogs.showWarningToast(context, "Please input users lastname");
      } else if (emailEditingController.text.trim().isEmpty) {
        Dialogs.showWarningToast(context, "Please input users email");
      } else if (profileImage != null) {
        uploadUserPhotoNoMessage(context);
        updateUserDetails(context);
      } else {
        updateUserDetails(context);
      }
    } else {
      if (passwordEditingController.text.trim() != confirmpasswordEditingController.text.trim()) {
        Dialogs.showWarningToast(context, "Password didn't match!");
      } else if (profileImage != null) {
        print('BEWSIT');
        uploadUserPhotoNoMessage(context);
        updateUserDetails(context);
        updateUserCredentialsNoMessage(context);
      } else {
        updateUserDetails(context);
        updateUserCredentialsNoMessage(context);
      }
    }
  }

  void checkStudentInput(context) {
    if (passwordEditingController.text.isEmpty) {
      if (usernameEditingController.text.trim().isEmpty) {
        Dialogs.showWarningToast(context, "Please input users code");
      } else if (firstnameEditingController.text.trim().isEmpty) {
        Dialogs.showWarningToast(context, "Please input users firstname");
      } else if (lastnameEditingController.text.trim().isEmpty) {
        Dialogs.showWarningToast(context, "Please input users lastname");
      } else if (emailEditingController.text.trim().isEmpty) {
        Dialogs.showWarningToast(context, "Please input users email");
      } else if (parentfullnameEditingController.text.trim().isEmpty &&
          parentemailEditingController.text.trim().isEmpty &&
          parentcontactnoEditingController.text.trim().isEmpty) {
        Dialogs.showWarningToast(context, "Parents info is required");
      } else if (profileImage != null) {
        uploadUserPhotoNoMessage(context);
        updateUserDetails(context);
      } else {
        updateUserDetails(context);
      }
    } else {
      if (passwordEditingController.text.trim() != confirmpasswordEditingController.text.trim()) {
        Dialogs.showWarningToast(context, "Password didn't match!");
      } else if (profileImage != null) {
        uploadUserPhotoNoMessage(context);
        updateUserDetails(context);
        updateUserCredentialsNoMessage(context);
      } else {
        updateUserDetails(context);
        updateUserCredentialsNoMessage(context);
      }
    }
  }

  void updateUserDetails(context) async {
    try {
      isLoading.value = true;
      var result = await EditUserApi.updateUserDetails(
        userID.value,
        Get.find<GetStorageService>().appdata.read('School_ID'),
        usernameEditingController.text.trim(),
        firstnameEditingController.text.trim(),
        lastnameEditingController.text.trim(),
        middlenameEditingController.text.trim(),
        addressEditingController.text.trim(),
        gender,
        userImage,
        educationalAttainmentEditingController.text.trim(),
        subjectmajorEditingController.text.trim(),
        positionEditingController.text.trim(),
        facebookEditingController.text.trim(),
        twitterEditingController.text.trim(),
        instagramEditingController.text.trim(),
        emailEditingController.text.trim(),
        skypeEditingController.text.trim(),
        zoomEditingController.text.trim(),
        userMotto,
        nicknameEditingController.text.trim(),
        dreamjobEditingController.text.trim(),
        yearEditingController.text.trim(),
        userType.value,
        parentfullnameEditingController.text.trim(),
        parentemailEditingController.text.trim(),
        parentcontactnoEditingController.text.trim(),
      );
      if (result == "Success") {
        isLoading.value = false;
        Get.back();
        Dialogs.showMyToast(context, "User details successfully updated!");
      } else if (result == "Email already exists") {
        isLoading.value = false;
        Dialogs.showErrorToast(context, "Email already exists");
      } else {
        isLoading.value = false;
        Dialogs.showErrorToast(context, "Error in updating a user details !");
      }
    } catch (error) {
      print("addUserDetails $error");
    } finally {
      if (usernameEditingController.text == 'null') {
        Get.find<EducatorListController>().getAllEducatorBySchoolId(1);
      } else {
        Get.find<StudentListController>().getAllStudentBySchoolId(1);
      }
    }
  }

  void updateUserCredentials(context) async {
    try {
      isLoading.value = true;
      var result = await EditUserApi.changeUserCredentials(
        Get.find<GetStorageService>().appdata.read('UserId'),
        usernameEditingController.text.trim(),
        passwordEditingController.text.trim(),
      );
      if (result == "Success") {
        isLoading.value = false;
        Dialogs.showMyToast(context, "User credentials successfully updated!");
      } else if (result == "Email already exists") {
        isLoading.value = false;
        Dialogs.showErrorToast(context, "Email already exists");
      } else {
        isLoading.value = false;
        Dialogs.showErrorToast(context, "Error in updating  user credentials !");
      }
    } catch (error) {
      print("updateUserCredentials $error");
    }
  }

  void updateUserCredentialsNoMessage(context) async {
    try {
      isLoading.value = true;
      var result = await EditUserApi.changeUserCredentials(
        Get.find<GetStorageService>().appdata.read('UserId'),
        usernameEditingController.text.trim(),
        passwordEditingController.text.trim(),
      );
    } catch (error) {
      print("addUserDetails $error");
    }
  }

  void uploadUserPhoto(context) async {
    try {
      var result = await EditUserApi.uploadUserPhoto(
        profileImage!,
        Get.find<GetStorageService>().appdata.read('UserId'),
      );
      if (result == "Success") {
        Get.back();
        Dialogs.showMyToast(context, "Profile Image successfully save!");
        filenameimageprofile.value = '';
        fileTypeimageprofile.value = '';
        profileImage = null;
        attachments2.length = 0;
      } else {
        Dialogs.showErrorToast(context, "Error in saving profile image!");
      }
    } catch (e) {
      print('err $e');
    } finally {}
  }

  void uploadUserPhotoNoMessage(context) async {
    try {
      var result = await EditUserApi.uploadUserPhoto(
        profileImage!,
        Get.find<GetStorageService>().appdata.read('UserId'),
      );
      if (result == "Success") {
        filenameimageprofile.value = '';
        fileTypeimageprofile.value = '';
        profileImage = null;
        attachments2.length = 0;
      } else {}
    } catch (e) {
      print('err $e');
    } finally {}
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

  // Future getCoverImage() async {
  //   FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['jpg', 'png', 'jpeg'],
  //   );
  //   print("FilePickerResult Response : ${pickedFile.toString()}");

  //   if (pickedFile != null) {
  //     File imgprofile = File(pickedFile.files.single.path!);
  //     attachments1.add(pickedFile.files.single.path!);
  //     print("Image $attachments2");
  //     try {
  //       coverImage = imgprofile;
  //       filenamewholeimge.value = imgprofile.path.split('/').last;
  //       var splitTheimage = filenamewholeimge.split('.');
  //       filenameimagecover.value = splitTheimage[0];
  //       fileTypeimageCover.value = splitTheimage[1];
  //       isLoading(false);
  //       update();
  //     } catch (e) {
  //       print("image path errror");
  //     }
  //   } else {}
  // }
}
