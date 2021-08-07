import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementController extends GetxController {
  var detailsEditingController = TextEditingController();

  File? image;
  var filenameimageprofile = "".obs;
  var fileTypeimageprofile = "".obs;

  Future getImage() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    print("FilePickerResult Response : ${pickedFile.toString()}");

    if (pickedFile != null) {
      File? imgprofile = File(pickedFile.files.single.path!);

      try {
        image = imgprofile;
        String filenamewholeimge = imgprofile.path.split('/').last;
        var splitTheimage = filenamewholeimge.split('.');
        filenameimageprofile.value = splitTheimage[0];
        fileTypeimageprofile.value = splitTheimage[1];
        update();
      } catch (e) {
        print("image path errror");
      }
    } else {}
  }
}
