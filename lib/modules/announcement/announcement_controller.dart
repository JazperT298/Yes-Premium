import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:yes_premium/modules/announcement/announcement_api.dart';
import 'package:yes_premium/modules/home/home_api.dart';
import 'package:yes_premium/modules/home/home_controller.dart';
import 'package:yes_premium/shared/dialogs.dart';

class AnnouncementController extends GetxController {
  var detailsEditingController = TextEditingController();
  // final homeController = Get.find<HomeController>();
  RxList<String> attachments = <String>[].obs;
  RxList<String> videoAttachments = <String>[].obs;
  late VideoPlayerController videoController;
  File? image;
  File? video;
  File? imgprofile;
  var filenameimageprofile = "".obs;
  var fileTypeimageprofile = "".obs;
  var filenamevideoprofile = "".obs;
  var fileTypevideoprofile = "".obs;
  var filenamewholeimge = "".obs;

  Future getImage() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    print("FilePickerResult Response : ${pickedFile.toString()}");

    if (pickedFile != null) {
      imgprofile = File(pickedFile.files.single.path!);
      attachments.add(pickedFile.files.single.path!);
      print("Image $attachments");
      try {
        image = imgprofile;
        filenamewholeimge.value = imgprofile!.path.split('/').last;
        var splitTheimage = filenamewholeimge.split('.');
        filenameimageprofile.value = splitTheimage[0];
        fileTypeimageprofile.value = splitTheimage[1];
        print("image path ${filenamewholeimge.value}");
        print("image path $splitTheimage");

        print("image path ${filenameimageprofile.value}");
        print("image path ${fileTypeimageprofile.value}");
        update();
      } catch (e) {
        print("image path errror");
      }
    } else {}
  }

  Future getVideo() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4', 'flv', 'wmv'],
    );
    print("FilePickerResult Response : ${pickedFile.toString()}");

    if (pickedFile != null) {
      imgprofile = File(pickedFile.files.single.path!);

      attachments.add(pickedFile.files.single.path!);

      try {
        video = imgprofile;
        String filenamewholeimge = imgprofile!.path.split('/').last;
        var splitTheimage = filenamewholeimge.split('.');
        filenamevideoprofile.value = splitTheimage[0];
        fileTypevideoprofile.value = splitTheimage[1];
        update();
      } catch (e) {
        print("'video' path errror");
      }
    } else {}
  }

  @override
  void onInit() {
    super.onInit();
  }

  void uploadSchoolPosts(context, fileToUpload, details, schoolId) async {
    try {
      var result = await AnnouncementApi.uploadSchoolPost(
          fileToUpload, details, schoolId);
      if (result == "Success") {
        Get.back();
        Dialogs.showMyToast(context, "Annoucenment successfully posted!");
        filenamevideoprofile.value = '';
        fileTypevideoprofile.value = '';
        detailsEditingController.text = "";
        filenameimageprofile.value = "";
        fileTypeimageprofile.value = "";
        attachments.length = 0;
      } else {
        Dialogs.showMyToast(context, "Error posting an announcement  !");
      }
    } catch (e) {
      print('err $e');
    } finally {
      // HomeApi.getAllAnnouncementBySchool(1);
      Get.find<HomeController>().getAllAnnouncementBySchool();
    }
  }

  void deleteAnnouncement(announceID, schoolID) async {
    try {
      await AnnouncementApi.deleteAnnouncement(announceID, schoolID);
    } catch (error) {
      print("deleteStoreRider $error");
    } finally {
      //HomeApi.getAllAnnouncementBySchool();
      Get.find<HomeController>().getAllAnnouncementBySchool();
    }
  }
}
