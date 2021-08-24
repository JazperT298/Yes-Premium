import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/models/students.dart';
import 'package:yes_premium/modules/studentlist/student_api.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class StudentListController extends GetxController {
  var searchEditingController = TextEditingController();
  final scrollController = TrackingScrollController();
  final storageService = Get.find<GetStorageService>();
  RxBool isSearchClick = false.obs;
  RxBool isAccountDisabled = false.obs;
  var isLoading = true.obs;
  RxList<StudentsData> studentsDataList = <StudentsData>[].obs;
  int counter = 1;
  Timer? timer;
  @override
  void onInit() {
    isSearchClick.value = false;
    isAccountDisabled.value = false;
    getAllStudentBySchoolId(counter);
    //incrementStudentData();
    super.onInit();
  }

  void getAllStudentBySchoolId(counter) async {
    try {
      List result = await StudentApi.getAllStudentBySchoolId(counter);
      if (!isLoading.value) isLoading(true);
      for (var i = 0; i < result.length; i++) {
        Map mapping = {
          "User_ID": result[i]['User_ID'],
          "User_SchoolID": result[i]['User_SchoolID'],
          "User_Code": result[i]['User_Code'],
          "User_Firstname": result[i]['User_Firstname'],
          "User_Lastname": result[i]['User_Lastname'],
          "User_Middlename": result[i]['User_Middlename'],
          "User_Birthday": result[i]['User_Birthday'],
          "User_Address": result[i]['User_Address'],
          "User_Gender": result[i]['User_Gender'],
          "User_Image": result[i]['User_Image'],
          "User_CoverImage": result[i]['User_CoverImage'],
          "User_EducationalAttainment": result[i]['User_EducationalAttainment'],
          "User_SubjMajor": result[i]['User_SubjMajor'],
          "User_Position": result[i]['User_Position'],
          "User_Facebook": result[i]['User_Facebook'],
          "User_Twitter": result[i]['User_Twitter'],
          "User_Instagram": result[i]['User_Instagram'],
          "User_Email": result[i]['User_Email'],
          "User_Skype": result[i]['User_Skype'],
          "User_Zoom": result[i]['User_Zoom'],
          "User_Motto": result[i]['User_Motto'],
          "User_Nickname": result[i]['User_Nickname'],
          "User_Dreamjob": result[i]['User_Dreamjob'],
          "User_Year": result[i]['User_Year'],
          "User_Type": result[i]['User_Type'],
          "UserName": result[i]['UserName'],
          "School_Name": result[i]['School_Name'],
          "School_Logo": result[i]['School_Logo'],
          "Parent_Fullname": result[i]['Parent_Fullname'],
          "Parent_Email": result[i]['Parent_Email'],
          "Parent_ContactNumber": result[i]['Parent_ContactNumber'],
          "Name": result[i]['Name'],
          "LockoutEnabled": result[i]['LockoutEnabled'],
        };

        var jsonStringEncoded = jsonEncode(mapping);
        storageService.saveStudentItems(jsonStringEncoded);
        studentsDataList.add(studentsdataFromJson(jsonStringEncoded));
      }
      isLoading(false);
    } catch (e) {
      print('err $e');
    }
  }

  void searchStudent(schoolID, searchKeyword) async {
    try {
      List result = await StudentApi.searchStudent(schoolID, searchKeyword);
      studentsDataList.clear();
      if (!isLoading.value) isLoading(true);
      for (var i = 0; i < result.length; i++) {
        Map mapping = {
          "User_ID": result[i]['User_ID'],
          "User_SchoolID": result[i]['User_SchoolID'],
          "User_Code": result[i]['User_Code'],
          "User_Firstname": result[i]['User_Firstname'],
          "User_Lastname": result[i]['User_Lastname'],
          "User_Middlename": result[i]['User_Middlename'],
          "User_Birthday": result[i]['User_Birthday'],
          "User_Address": result[i]['User_Address'],
          "User_Gender": result[i]['User_Gender'],
          "User_Image": result[i]['User_Image'],
          "User_CoverImage": result[i]['User_CoverImage'],
          "User_EducationalAttainment": result[i]['User_EducationalAttainment'],
          "User_SubjMajor": result[i]['User_SubjMajor'],
          "User_Position": result[i]['User_Position'],
          "User_Facebook": result[i]['User_Facebook'],
          "User_Twitter": result[i]['User_Twitter'],
          "User_Instagram": result[i]['User_Instagram'],
          "User_Email": result[i]['User_Email'],
          "User_Skype": result[i]['User_Skype'],
          "User_Zoom": result[i]['User_Zoom'],
          "User_Motto": result[i]['User_Motto'],
          "User_Nickname": result[i]['User_Nickname'],
          "User_Dreamjob": result[i]['User_Dreamjob'],
          "User_Year": result[i]['User_Year'],
          "User_Type": result[i]['User_Type'],
          "UserName": result[i]['UserName'],
          "School_Name": result[i]['School_Name'],
          "School_Logo": result[i]['School_Logo'],
          "Parent_Fullname": result[i]['Parent_Fullname'],
          "Parent_Email": result[i]['Parent_Email'],
          "Parent_ContactNumber": result[i]['Parent_ContactNumber'],
          "Name": result[i]['Name'],
          "LockoutEnabled": result[i]['LockoutEnabled'],
        };

        var jsonStringEncoded = jsonEncode(mapping);
        studentsDataList.add(studentsdataFromJson(jsonStringEncoded));
      }
      isLoading(false);
    } catch (e) {
      print('err $e');
    }
  }

  // incrementStudentData() async {
  //   Timer.periodic(Duration(seconds: 3), (timer) {
  //     print('YAWA STUDENT ${studentsDataList.length}');
  //     if (counter == 5) {
  //       timer.cancel();
  //     } else {
  //       counter++;
  //       getAllStudentBySchoolId(counter);
  //     }
  //   });
  // }
}
