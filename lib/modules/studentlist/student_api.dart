import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:http/http.dart' as http;

class StudentApi {
  static var client = http.Client();

  static Future getAllStudentBySchoolId() async {
    try {
      var response = await client.get(
        Uri.parse(
            '$baseUrl/api/Student/GetAllStudentBySchoolId?schoolId=${Get.find<GetStorageService>().appdata.read('SchoolId')}&offset=1'),

        headers: {
          "access-control-allow-origin": "*",
          'content-type': 'application/x-www-form-urlencoded',
          'Authorization':
              'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
        },
        // encoding: Encoding.getByName('utf-8'),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              "getAllStudentBySchoolId Services Connection timeout.");
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body)['Data'];
        // var jsonStringEncoded = jsonEncode(jsonString);
        // print(jsonStringEncoded);
        // return announcementdataFromJson(jsonStringEncoded);
        return jsonString;
      } else {
        print('getAllStudentBySchoolId Services  error');
        return null;
      }
    } on TimeoutException catch (_) {
      print('getAllStudentBySchoolId Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('getAllStudentBySchoolId Services Socket error');
      return null;
    } catch (e) {
      print('getAllStudentBySchoolId Services  Err $e');
      return null;
    }
  }
}
