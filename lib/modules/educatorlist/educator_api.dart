import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:http/http.dart' as http;

class EducatorAoi {
  static var client = http.Client();

  static Future getAllEducatorBySchoolId(counter) async {
    try {
      var response = await client.get(
        Uri.parse(
            '$baseUrl/api/Educator/GetAllEducatorBySchoolId?schoolId=${Get.find<GetStorageService>().appdata.read('SchoolId')}&offset=$counter'),

        headers: {
          "access-control-allow-origin": "*",
          'content-type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
        },
        // encoding: Encoding.getByName('utf-8'),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException("getAllEducatorBySchoolId Services Connection timeout.");
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
        print('getAllEducatorBySchoolId Services  error');
        return null;
      }
    } on TimeoutException catch (_) {
      print('getAllEducatorBySchoolId Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('getAllEducatorBySchoolId Services Socket error');
      return null;
    } catch (e) {
      print('getAllEducatorBySchoolId Services  Err $e');
      return null;
    }
  }

  static Future searchEducator(schoolID, searchWord) async {
    try {
      var response = await client.get(
        Uri.parse('$baseUrl/api/Educator/SearchEducator?schoolID=$schoolID&searchWord=$searchWord'),
        headers: {
          "access-control-allow-origin": "*",
          'content-type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException("searchEducator Services Connection timeout.");
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body)['Data'];

        return jsonString;
      } else {
        print('searchEducator Services  error');
        return null;
      }
    } on TimeoutException catch (_) {
      print('searchEducator Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('searchEducator Services Socket error');
      return null;
    } catch (e) {
      print('searchEducator Services  Err $e');
      return null;
    }
  }
}
