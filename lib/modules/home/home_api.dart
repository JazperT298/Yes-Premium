import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:get/get.dart';

class HomeApi {
  static var client = http.Client();

  static Future getEducatorDetails() async {
    try {
      var response = await client.get(
        Uri.parse(
            '$baseUrl/api/Users/GetUserDetails?userName=${Get.find<GetStorageService>().appdata.read('userName')}'),

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
              "getEducatorDetails Services Connection timeout.");
        },
      );
      print(response.body);
    } on TimeoutException catch (_) {
      print('getEducatorDetails Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('getEducatorDetails Services Socket error');
      return null;
    } catch (e) {
      print('getEducatorDetails Services  Err $e');
      return null;
    }
  }
}
