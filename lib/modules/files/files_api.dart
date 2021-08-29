import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class FilesApi {
  static var client = http.Client();

  static Future getUserNotesLists() async {
    try {
      var response = await client.get(
        Uri.parse(
            '$baseUrl/api/UserNotes/GetAllUserNotes?userID=${Get.find<GetStorageService>().appdata.read('UserId')}&schoolId=${Get.find<GetStorageService>().appdata.read('SchoolId')}&offset=1'),

        headers: {
          "access-control-allow-origin": "*",
          'content-type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
        },
        // encoding: Encoding.getByName('utf-8'),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException("getUserNotesLists Services Connection timeout.");
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
        print('getUserNotesLists Services  error');
        return null;
      }
    } on TimeoutException catch (_) {
      print('getUserNotesLists Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('getUserNotesLists Services Socket error');
      return null;
    } catch (e) {
      print('getUserNotesLists Services  Err $e');
      return null;
    }
  }

  static Future deleteUserNotes(notesID, userID, schoolID) async {
    try {
      var response = await client.post(Uri.parse('$baseUrl/api/UserNotes/DeleteUserNotes'), headers: {
        "access-control-allow-origin": "*",
        'content-type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
      }, body: {
        "Notes_ID": notesID.toString(),
        "User_ID": userID.toString(),
        "School_ID": schoolID.toString(),
      }).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException("deleteUserNotes Services Connection timeout.");
        },
      );
      if (response.statusCode == 200) {
        var message = jsonDecode(response.body)['Message'];
        print('message $message');
        return message;
      } else {
        print('deleteVideoLibrary Services  error');
        return null;
      }
    } on TimeoutException catch (_) {
      print('deleteUserNotes Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('deleteUserNotes Services Socket error');
      return null;
    } catch (e) {
      print('deleteUserNotes Services  Err $e');
      return null;
    }
  }
}
