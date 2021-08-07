import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/models/login_data.dart';
import 'package:yes_premium/models/user_data.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class LoginApi {
  static var client = http.Client();

  static Future loginUser(username, password) async {
    try {
      var response = await client.post(Uri.parse('$baseUrl/auth/Token'), body: {
        "grant_type": 'password',
        "username": username.toString(),
        "password": password.toString(),
      }).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException("loginUser Services Connection timeout.");
        },
      );
      print('response.body ${response.body}');

      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        //if ((response.body.contains('bearer'))) {
        var jsonStringEncoded = jsonEncode(jsonString);
        print('[$jsonStringEncoded]');
        return loginFromJson('[$jsonStringEncoded]');
        //} else {
        //print('yawa');
        //}
      } else {
        print('loginUser Services  error');
        return null;
      }
    } on TimeoutException catch (_) {
      print('loginUser Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('loginUser Services Socket error');
      return null;
    } catch (e) {
      print('loginUser Services  Err $e');
      return null;
    }
  }

  static Future getUserDetails() async {
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
          throw TimeoutException("getUserDetails Services Connection timeout.");
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body)['Data'];
        var jsonStringEncoded = jsonEncode(jsonString);
        print(jsonStringEncoded);
        return userdataFromJson('[$jsonStringEncoded]');
      } else {
        print('getUserDetails Services  error');
        return null;
      }
    } on TimeoutException catch (_) {
      print('getUserDetails Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('getUserDetails Services Socket error');
      return null;
    } catch (e) {
      print('getUserDetails Services  Err $e');
      return null;
    }
  }
}
