import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class FilesShareApi {
  static var client = http.Client();
  static Future shareNotesToUser(notesID, sharedUserID, ownerUserID) async {
    try {
      var response = await client
          .post(Uri.parse('$baseUrl/api/UserNotes/ShareNotesToUser'), headers: {
        "access-control-allow-origin": "*",
        'content-type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
      }, body: {
        "SharedUserID": sharedUserID.toString(),
        "Notes_ID": notesID.toString(),
        "OwnerUserID": ownerUserID.toString(),
      }).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              "shareNotesToUser Services Connection timeout.");
        },
      );
      if (response.statusCode == 200) {
        var message = jsonDecode(response.body)['Message'];
        print('$message');
        return message;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print('shareNotesToUser Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('shareNotesToUser Services Socket error');
      return null;
    } catch (e) {
      print('shareNotesToUser Services  Err $e');
      return null;
    }
  }
}
