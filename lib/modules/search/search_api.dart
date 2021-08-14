import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:http/http.dart' as http;

class SearchApi {
  static var client = http.Client();
  static Future getAllUserBySearchKeyword(schoolID, searchKeyword) async {
    try {
      var response = await client.get(
        Uri.parse(
            '$baseUrl/api/Users/GetAllUserBySearchKeyword?schoolID=$schoolID&searchKeyword=$searchKeyword'),
        headers: {
          "access-control-allow-origin": "*",
          'content-type': 'application/x-www-form-urlencoded',
          'Authorization':
              'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              "getAllUserBySearchKeyword Services Connection timeout.");
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body)['Data'];

        return jsonString;
      } else {
        print('getAllUserBySearchKeyword Services  error');
        return null;
      }
    } on TimeoutException catch (_) {
      print('getAllUserBySearchKeyword Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('getAllUserBySearchKeyword Services Socket error');
      return null;
    } catch (e) {
      print('getAllUserBySearchKeyword Services  Err $e');
      return null;
    }
  }
}
