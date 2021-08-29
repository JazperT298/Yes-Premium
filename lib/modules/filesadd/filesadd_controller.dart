import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/models/notes.dart';
import 'package:yes_premium/modules/files/files_controller.dart';
import 'package:yes_premium/modules/filesadd/filesadd_api.dart';
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
  var filename = "".obs;
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
    filename.value = Get.arguments['Notes_FileName'];
    imgprofile = Get.arguments['Notes_File'];
    print(imgprofile);
  }

  void addUserNotes(context, userID, schoolID, notesTitle, notesDesc,
      filenameprofile, file) async {
    try {
      isLoading.value = true;
      var result = await FilesAddApi.addUserNotes(
          userID, schoolID, notesTitle, notesDesc, filenameprofile, file!);
      if (result == "Success") {
        Get.back();
        isLoading.value = false;
        Dialogs.showMyToast(context, "Notes successfully posted!");
        filenameprofile.value = '';
        fileTypeprofile.value = '';
        detailsEditingController.text = "";
        titleEditingController.text = "";
        attachments.length = 0;
      } else {
        isLoading.value = false;
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

  void updateUserNotes(context, notesID, userID, schoolID, notesTitle,
      notesDesc, filenameprofile, file) async {
    try {
      var result = await FilesAddApi.updateUserNotes(notesID, userID, schoolID,
          notesTitle, notesDesc, filenameprofile, file!);
      if (result == "Success") {
        Get.back();
        Dialogs.showMyToast(context, "Notes successfully updated!");
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
}
