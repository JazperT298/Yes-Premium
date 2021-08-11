import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class AnnouncementApi {
  static var client = http.Client();
  static Future uploadSchoolPost(File fileToUpload, details, schoolId) async {
    Uint8List imagereadasbytes = await fileToUpload.readAsBytes();
    try {
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Access-Control-Allow-Origin': '*',
        'Authorization':
            'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/api/Announcement/UploadSchoolPost'));
      request.fields.addAll({
        'Details': details.toString(),
        'SchoolId': schoolId.toString(),
      });
      request.files
          .add(await http.MultipartFile.fromPath('Images', fileToUpload.path));
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
      // var response = await client.post(
      //     Uri.parse('$baseUrl/api/Announcement/UploadSchoolPost'),
      //     headers: {
      //       "access-control-allow-origin": "*",
      //       'content-type': 'application/x-www-form-urlencoded',
      //       'Authorization':
      //           'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
      //     },
      //     body: {
      //       "Images": fileToUpload.path,
      //       "Details": details.toString(),
      //       "SchoolId": schoolId.toString(),
      //     }).timeout(
      //   const Duration(seconds: 10),
      //   onTimeout: () {
      //     throw TimeoutException(
      //         "uploadSchoolPost Services Connection timeout.");
      //   },
      //);
      // print('response.body ${response.body}');

      // if (response.statusCode == 200) {
      //   var data = jsonDecode(response.body)['Message'];
      //   return data;
      // } else {
      //   print('saveReport Services  error');
      //   return null;
      // }
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

  static Future deleteAnnouncement(announceID, schoolID) async {
    try {
      var response = await client.post(
          Uri.parse('$baseUrl/api/Announcement/DeleteAnnouncement'),
          headers: {
            "access-control-allow-origin": "*",
            'content-type': 'application/x-www-form-urlencoded',
            'Authorization':
                'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
          },
          body: {
            "Announce_ID": announceID.toString(),
            "Announce_School_ID": schoolID.toString(),
          }).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              "deleteAnnouncement Services Connection timeout.");
        },
      );
      if (response.statusCode == 200 && json.decode(response.body)['Success']) {
        return response.body;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print('deleteAnnouncement Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('deleteAnnouncement Services Socket error');
      return null;
    } catch (e) {
      print('deleteAnnouncement Services  Err $e');
      return null;
    }
  }
}
