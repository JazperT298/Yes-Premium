import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/modules/editschool/editschool_api.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';

class EditSchoolController extends GetxController {
  var schoolID = ''.obs;
  var schoolName = ''.obs;
  var schoolLogo = ''.obs;
  var schoolAddress = ''.obs;
  var schoolDetails = ''.obs;
  var schoolMotto = ''.obs;
  var adminUsername = ''.obs;

  final name = TextEditingController();
  final address = TextEditingController();
  final details = TextEditingController();
  final motto = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  File? imageProfile;
  File? imgprofile;
  var filenameimageProfile = ''.obs;
  var fileTypeimageProfile = ''.obs;
  RxList<String> attachments1 = <String>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    schoolID.value = Get.arguments['schoolID'];
    schoolName.value = Get.arguments['schoolName'];
    schoolLogo.value = Get.arguments['schoolLogo'];
    schoolAddress.value = Get.arguments['schoolAddress'];
    schoolDetails.value = Get.arguments['schoolDetails'];
    schoolMotto.value = Get.arguments['schoolMotto'];
    adminUsername.value = Get.arguments['adminUsername'];

    name.text = schoolName.value;
    address.text = schoolAddress.value;
    details.text = schoolDetails.value;
    motto.text = schoolMotto.value;
    username.text = adminUsername.value;

    isLoading.value = false;
  }

  Future<void> getImage() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    print("FilePickerResult Response : ${pickedFile.toString()}");

    if (pickedFile != null) {
      imgprofile = File(pickedFile.files.single.path!);
      attachments1.add(pickedFile.files.single.path!);
      try {
        imageProfile = imgprofile;
        String filenamewholeimge = imgprofile!.path.split('/').last;
        var splitTheimage = filenamewholeimge.split('.');
        filenameimageProfile.value = splitTheimage[0];
        fileTypeimageProfile.value = splitTheimage[1];
        print('${fileTypeimageProfile.value}');
        update();
      } catch (error) {
        print("getImage $error");
      }
    }
  }

  void checkInput(context) {
    if (password.text.isEmpty) {
      if (name.text == schoolName.value &&
          address.text == schoolAddress.value &&
          details.text == schoolDetails.value &&
          motto.text == schoolMotto.value &&
          username.text == adminUsername.value &&
          imgprofile == null) {
        Get.back();
      } else if (name.text == schoolName.value &&
          address.text == schoolAddress.value &&
          details.text == schoolDetails.value &&
          motto.text == schoolMotto.value &&
          username.text == adminUsername.value &&
          imgprofile != null) {
        //print('LANMI');
        uploadSchoolPhoto(context);
      } else if (imgprofile != null) {
        //print('AGAY');
        updateSchoolDetailsWithoutPassword(context);
        uploadSchoolPhoto(context);
      } else {
        updateSchoolDetailsWithoutPassword(context);
      }
    } else {
      if (password.text.trim() != confirmpassword.text.trim()) {
        Dialogs.showWarningToast(context, "Password didn't match!");
      } else if (imgprofile != null) {
        //print('AGAY 2');
        updateSchoolDetailsWithPassword(context);
        uploadSchoolPhoto(context);
      } else {
        // print("BURIKAt");
        updateSchoolDetailsWithPassword(context);
      }
    }
    // if (name.text == schoolName.value &&
    //     address.text == schoolAddress.value &&
    //     details.text == schoolDetails.value &&
    //     motto.text == schoolMotto.value &&
    //     username.text == adminUsername.value) {
    //   Get.back();
    // } else if (password.text.trim() != confirmpassword.text.trim()) {
    //   Dialogs.showMyToast(context, "Password didn't match!");
    // } else {
    //   //updateSchoolDetails(context);
    // }
  }

  void updateSchoolDetailsWithoutPassword(context) async {
    try {
      isLoading.value = true;
      var result = await EditSchoolApi.updateSchoolDetails(
        Get.find<GetStorageService>().appdata.read('School_ID'),
        name.text.trim(),
        Get.find<GetStorageService>().appdata.read('School_Logo'),
        address.text.trim(),
        details.text.trim(),
        motto.text.trim(),
        Get.find<GetStorageService>().appdata.read('School_Abbreviation'),
        Get.find<GetStorageService>().appdata.read('School_Code'),
        username.text.trim(),
        null,
      );
      if (result == "Success") {
        isLoading.value = false;
        Get.back();
        Dialogs.showMyToast(context, "School account successfully updated!");
        filenameimageProfile.value = '';
        fileTypeimageProfile.value = '';
        attachments1.length = 0;
      } else {
        isLoading.value = false;
        Dialogs.showErrorToast(context, "Error in updating school account  !");
      }
    } catch (e) {
      print('err $e');
    } finally {
      Get.find<GetStorageService>().setSchoolDataStorage(
        Get.find<GetStorageService>().appdata.read('School_ID'),
        name.text.trim(),
        Get.find<GetStorageService>().appdata.read('School_Logo'),
        address.text.trim(),
        details.text.trim(),
        Get.find<GetStorageService>().appdata.read('School_Created'),
        motto.text.trim(),
        Get.find<GetStorageService>().appdata.read('School_Abbreviation'),
        Get.find<GetStorageService>().appdata.read('School_Code'),
        username.text.trim(),
        null,
      );
    }
  }

  void updateSchoolDetailsWithPassword(context) async {
    try {
      isLoading.value = true;
      var result = await EditSchoolApi.updateSchoolDetails(
          Get.find<GetStorageService>().appdata.read('School_ID'),
          name.text.trim(),
          Get.find<GetStorageService>().appdata.read('School_Logo'),
          address.text.trim(),
          details.text.trim(),
          motto.text.trim(),
          Get.find<GetStorageService>().appdata.read('School_Abbreviation'),
          Get.find<GetStorageService>().appdata.read('School_Code'),
          username.text.trim(),
          password.text.trim());
      if (result == "Success") {
        isLoading.value = false;
        Get.back();
        Dialogs.showMyToast(context, "School account successfully updated!");
        filenameimageProfile.value = '';
        fileTypeimageProfile.value = '';

        attachments1.length = 0;
      } else {
        isLoading.value = false;
        Dialogs.showErrorToast(context, "Error in updating school account  !");
      }
    } catch (e) {
      print('err $e');
    } finally {
      Get.find<GetStorageService>().setSchoolDataStorage(
        Get.find<GetStorageService>().appdata.read('School_ID'),
        name.text.trim(),
        Get.find<GetStorageService>().appdata.read('School_Logo'),
        address.text.trim(),
        details.text.trim(),
        Get.find<GetStorageService>().appdata.read('School_Created'),
        motto.text.trim(),
        Get.find<GetStorageService>().appdata.read('School_Abbreviation'),
        Get.find<GetStorageService>().appdata.read('School_Code'),
        username.text.trim(),
        password.text.trim(),
      );
    }
  }

  void uploadSchoolPhoto(context) async {
    try {
      var result = await EditSchoolApi.uploadSchoolPhoto(
        imgprofile!,
        Get.find<GetStorageService>().appdata.read('School_ID'),
      );
      if (result == "Success") {
        Get.back();
        Dialogs.showMyToast(context, "School logo successfully updated!");
        filenameimageProfile.value = '';
        fileTypeimageProfile.value = '';
        imgprofile = null;
        attachments1.length = 0;
      } else {
        Dialogs.showMyToast(context, "Error in updating school logo!");
      }
    } catch (e) {
      print('err $e');
    } finally {
      // HomeApi.getAllAnnouncementBySchool(1);
      // Get.find<HomeController>().getAllAnnouncementBySchool();
    }
  }
}
