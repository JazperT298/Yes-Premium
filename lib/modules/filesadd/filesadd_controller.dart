import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/models/notes.dart';
import 'package:yes_premium/modules/files/files_controller.dart';
import 'package:yes_premium/modules/filesadd/filesadd_api.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';

class FilesAddController extends GetxController {
  var titleEditingController = TextEditingController();
  var detailsEditingController = TextEditingController();
  RxList<String> attachments = <String>[].obs;
  RxList<String> videoAttachments = <String>[].obs;
  NotesData? notesData;

  RxString title = "".obs;
  RxString notesID = "".obs;
  RxString userID = "".obs;
  RxString schoolID = "".obs;
  RxString notesTitle = "".obs;
  RxString notesDesc = "".obs;
  RxString notesFilename = "".obs;
  RxString noteFile = "".obs;
  File? file;
  File? imgprofile;

  var filenameprofile = "".obs;
  var fileTypeprofile = "".obs;
  var splitTheimage;
  var isLoading = true.obs;
  int counter = 1;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;
    title.value = Get.arguments['Title'];
    notesID.value = Get.arguments['Notes_ID'];
    userID.value = Get.arguments['User_ID'];
    schoolID.value = Get.arguments['School_ID'];
    titleEditingController.text = Get.arguments['Notes_Title'];
    detailsEditingController.text = Get.arguments['Notes_Desc'];
    filenameprofile.value = Get.arguments['Notes_FileName'];
    imgprofile = Get.arguments['Notes_File'];
  }

  void addUserNotes(context, notesData) async {
    try {
      var result = await FilesAddApi.addUserNotes(notesData);
      if (result == "Success") {
        Get.back();
        Dialogs.showMyToast(context, "Notes successfully posted!");
        filenameprofile.value = '';
        fileTypeprofile.value = '';
        detailsEditingController.text = "";
        titleEditingController.text = "";

        attachments.length = 0;
      } else {
        Dialogs.showMyToast(context, "Error posting an Notes!");
      }
    } catch (e) {
      print('err $e');
    } finally {
      Get.find<FilesController>().getUserNotesLists();
    }
  }

  Future getFiles() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pptx', 'docx', 'pdf', 'xlsx'],
    );
    print("FilePickerResult Response : ${pickedFile.toString()}");

    if (pickedFile != null) {
      imgprofile = File(pickedFile.files.single.path!);

      attachments.add(pickedFile.files.single.path!);

      try {
        file = imgprofile;
        String filenamewholeimge = imgprofile!.path.split('/').last;
        splitTheimage = filenamewholeimge.split('.');
        filenameprofile.value = splitTheimage[0];
        fileTypeprofile.value = splitTheimage[1];
        update();
      } catch (e) {
        print("'File' path errror");
      }
    } else {}
  }

  void mapNotesData(context, notesData) async {
    if (titleEditingController.text.isNotEmpty) {
      notesData.userID = Get.find<GetStorageService>().appdata.read('UserId');
      print('BWESIT KA  ${notesData.userID}');
      notesData.schoolID =
          Get.find<GetStorageService>().appdata.read('SchoolId');
      notesData.notesTitle = titleEditingController.text;
      notesData.notesDesc = detailsEditingController.text;
      notesData.notesFileName = filenameprofile.value;
      notesData.notesFile = file;
      print('BWESIT KA  ${notesData.userID}');
      print('BWESIT KA  ${notesData.schoolID}');
      print('BWESIT KA  ${notesData.notesTitle}');
      print('BWESIT KA  ${notesData.notesDesc}');
      print('BWESIT KA  ${notesData.notesFileName}');

      print('BWESIT KA  ${notesData.notesFile}');

      addUserNotes(context, notesData);
    }
  }

  void updateUserNotes(context, notesData) async {
    try {
      var result = await FilesAddApi.updateUserNotes(notesData);
      if (result == "Success") {
        Get.back();
        Dialogs.showMyToast(context, "Notes successfully posted!");
        filenameprofile.value = '';
        fileTypeprofile.value = '';
        detailsEditingController.text = "";
        titleEditingController.text = "";

        attachments.length = 0;
      } else {
        Dialogs.showMyToast(context, "Error posting an Notes!");
      }
    } catch (e) {
      print('err $e');
    } finally {
      Get.find<FilesController>().getUserNotesLists();
    }
  }

  void mapUpdateNotesData(context) async {
    //NotesData? notesData;
    print('BWESIT KA  $imgprofile');
    if (titleEditingController.text.isNotEmpty) {
      Map mapping = {
        "Notes_ID": notesID.value,
        "User_ID": userID.value,
        "School_ID": schoolID.value,
        "Notes_Title": titleEditingController.text,
        "Notes_Desc": detailsEditingController.text,
        "Notes_FileName": filenameprofile.value,
        "Notes_File": imgprofile!,
      };

      var jsonStringEncoded = jsonEncode(mapping);
      var notesData = notesdataFromJson(jsonStringEncoded);
      // notesData.notesID;
      // notesData.userID;
      // notesData.schoolID;
      // notesData.notesTitle;
      // notesData.notesDesc;
      // notesData.notesFileName;
      // notesData.notesFile;
      // notesData!.notesID = notesID.value;
      // notesData.userID = userID.value;
      // notesData.schoolID = notesTitle.value;
      // notesData.notesTitle = titleEditingController.text;
      // notesData.notesDesc = detailsEditingController.text;
      // notesData.notesFileName = splitTheimage.value;
      // notesData.notesFile = file;
      print('BWESIT KA1  ${notesData.notesID}');
      print('BWESIT KA2  ${notesData.userID}');
      print('BWESIT KA3  ${notesData.schoolID}');
      print('BWESIT KA4  ${notesData.notesTitle}');
      print('BWESIT KA5  ${notesData.notesDesc}');
      print('BWESIT KA6  ${notesData.notesFileName}');
      print('BWESIT KA7  ${notesData.notesFile}');

      updateUserNotes(context, notesData);
    }
  }
}
