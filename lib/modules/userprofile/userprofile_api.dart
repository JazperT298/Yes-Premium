import 'package:get/get.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/models/user_model.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:http/http.dart' as http;

class UserProfileApi {
  static var client = http.Client();
  static Future getUserDetailsById(userid) async {
    try {
      var response = await client.get(
        Uri.parse('$baseUrl/api/Users/GetUserDetailsById?userId=$userid'),

        headers: {
          "access-control-allow-origin": "*",
          'content-type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
        },
        // encoding: Encoding.getByName('utf-8'),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException("getUserDetailsById Services Connection timeout.");
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body)['Data'];
        var jsonStringEncoded = jsonEncode(jsonString);
        // print(jsonStringEncoded);
        // return announcementdataFromJson(jsonStringEncoded);
        print(jsonStringEncoded);
        return userModeldataFromJson('[$jsonStringEncoded]');
      } else {
        print('getUserDetailsById Services  error');
        return null;
      }
    } on TimeoutException catch (_) {
      print('getUserDetailsById Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('getUserDetailsById Services Socket error');
      return null;
    } catch (e) {
      print('getUserDetailsById Services  Err $e');
      return null;
    }
  }
}
