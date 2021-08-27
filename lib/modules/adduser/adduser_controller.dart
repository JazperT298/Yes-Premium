import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/modules/adduser/adduser_api.dart';
import 'package:yes_premium/modules/educatorlist/educatorlist_controller.dart';
import 'package:yes_premium/modules/studentlist/studentlist_controller.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';

class AddUserController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<String> attachments1 = <String>[].obs;
  RxList<String> attachments2 = <String>[].obs;
  late String platformResponse;

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

  File? profileImage;
  File? coverImage;

  var filenameimageprofile = "".obs;
  var fileTypeimageprofile = "".obs;
  var filenameimagecover = "".obs;
  var fileTypeimageCover = "".obs;
  var filenamewholeimge = "".obs;
  var userCode, gender, userImage, userMotto;
  var userType = ''.obs;
  @override
  void onInit() {
    isLoading.value = false;
    userType.value = Get.arguments['UserType'];
    super.onInit();
  }

  void checkEducatorInput(context) {
    if (firstnameEditingController.text.trim().isEmpty) {
      Dialogs.showWarningToast(context, "Please input users firstname");
    } else if (lastnameEditingController.text.trim().isEmpty) {
      Dialogs.showWarningToast(context, "Please input users lastname");
    } else if (emailEditingController.text.trim().isEmpty) {
      Dialogs.showWarningToast(context, "Please input users email");
    } else {
      addUserDetails(context);
    }
  }

  void checkStudentInput(context) {
    if (firstnameEditingController.text.trim().isEmpty) {
      Dialogs.showWarningToast(context, "Please input users firstname");
    } else if (lastnameEditingController.text.trim().isEmpty) {
      Dialogs.showWarningToast(context, "Please input users lastname");
    } else if (emailEditingController.text.trim().isEmpty) {
      Dialogs.showWarningToast(context, "Please input users email");
    } else if (parentfullnameEditingController.text.trim().isEmpty &&
        parentemailEditingController.text.trim().isEmpty &&
        parentcontactnoEditingController.text.trim().isEmpty) {
      Dialogs.showWarningToast(context, "Parents info is required");
    } else {
      addUserDetails(context);
    }
  }

  void addUserDetails(context) async {
    try {
      isLoading.value = true;
      var result = await AddUserApi.addUserDetails(
        Get.find<GetStorageService>().appdata.read('School_ID'),
        userIDEditingController.text.trim(),
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
        Dialogs.showMyToast(context, "New User successfully saved!");
      } else if (result == "Email already exists") {
        isLoading.value = false;
        Dialogs.showErrorToast(context, "Email already exists");
      } else {
        isLoading.value = false;
        Dialogs.showErrorToast(context, "Error in inserting new user  !");
      }
    } catch (error) {
      print("addUserDetails $error");
    } finally {
      if (userType.value == 'Educator') {
        Get.find<EducatorListController>().getAllEducatorBySchoolId(1);
      } else {
        Get.find<StudentListController>().getAllStudentBySchoolId(1);
      }
    }
  }

  void uploadUserPhoto(context) async {
    try {
      var result = await AddUserApi.uploadUserPhoto(
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

  void uploadUserCoverPhoto(context) async {
    try {
      var result = await AddUserApi.uploadUserCoverPhoto(
        coverImage!,
        Get.find<GetStorageService>().appdata.read('UserId'),
      );
      if (result == "Success") {
        Get.back();
        Dialogs.showMyToast(context, "Cover photo successfully save!");
        filenameimagecover.value = '';
        fileTypeimageCover.value = '';
        coverImage = null;
        attachments1.length = 0;
      } else {
        Dialogs.showErrorToast(context, "Error in saving cover photo!");
      }
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
