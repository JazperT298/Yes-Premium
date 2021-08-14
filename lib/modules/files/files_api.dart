import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/models/notes.dart';
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
          'Authorization':
              'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
        },
        // encoding: Encoding.getByName('utf-8'),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              "getUserNotesLists Services Connection timeout.");
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

  static Future addUserNotes(notesData) async {
    try {
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Access-Control-Allow-Origin': '*',
        'Authorization':
            'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/api/UserNotes/AddUserNotes'));
      request.fields.addAll({
        'Notes_ID': notesData.notesID!,
        'User_ID': notesData.userID!,
        'School_ID': notesData.schoolID!,
        'Notes_Title': notesData.notesTitle!,
        'Notes_Desc': notesData.notesDesc!,
        'Notes_FileName': notesData.notesFileName!,
      });
      request.files.add(await http.MultipartFile.fromPath(
          'Notes_File', notesData.notesFile!.path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        var message = jsonDecode(data)['Message'];
        print('$message');
        return message;
      } else {
        print(response.reasonPhrase);
      }
    } on TimeoutException catch (_) {
      print('uploadSchoolPost Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('uploadSchoolPost Services Socket error');
      return null;
    } catch (e) {
      print('uploadSchoolPost Services  Err $e');
      return null;
    }
  }
}
