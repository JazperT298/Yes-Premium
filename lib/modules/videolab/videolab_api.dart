import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:http/http.dart' as http;

class VideoLabApi {
  static var client = http.Client();

  static Future getSchoolVideoLibrary() async {
    try {
      var response = await client.get(
        Uri.parse(
            '$baseUrl/api/VideoLibrary/GetVideoLibraryBySchool?schoolID=${Get.find<GetStorageService>().appdata.read('SchoolId')}&userID=${Get.find<GetStorageService>().appdata.read('UserId')}&offset=1'),

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
              "getSchoolVideoLibrary Services Connection timeout.");
        },
      );
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body)['Data'];
        // var jsonStringEncoded = jsonEncode(jsonString);
        // print(jsonStringEncoded);
        // return announcementdataFromJson(jsonStringEncoded);
        return jsonString;
      } else {
        print('getSchoolVideoLibrary Services  error');
        return null;
      }
    } on TimeoutException catch (_) {
      print('getSchoolVideoLibrary Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('getSchoolVideoLibrary Services Socket error');
      return null;
    } catch (e) {
      print('getSchoolVideoLibrary Services  Err $e');
      return null;
    }
  }

  static Future uploadVideoLibrary(
      File fileToUpload, title, details, schoolId) async {
    try {
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Access-Control-Allow-Origin': '*',
        'Authorization':
            'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/api/VideoLibrary/UploadVideoLibrary'));
      request.fields.addAll({
        'VideoLib_Title': title.toString(),
        'VideoLib_Details': details.toString(),
        'SchoolId': schoolId.toString(),
      });
      request.files.add(await http.MultipartFile.fromPath(
          'VideoLib_File', fileToUpload.path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        var message = jsonDecode(data)['Message'];
        print('YAW $message');
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

  static Future deleteVideoLibrary(videoLibId, schoolId) async {
    try {
      var response = await client.post(
          Uri.parse('$baseUrl/api/VideoLibrary/DeleteVideoLibrary'),
          headers: {
            "access-control-allow-origin": "*",
            'content-type': 'application/x-www-form-urlencoded',
            'Authorization':
                'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
          },
          body: {
            "VideoLib_ID": videoLibId.toString(),
            "School_ID": schoolId.toString(),
          }).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              "deleteVideoLibrary Services Connection timeout.");
        },
      );
      print('deleteVideoLibrary.body ${response.body}');

      if (response.statusCode == 200) {
        var message = jsonDecode(response.body)['Message'];
        print('message $message');
        return message;
      } else {
        print('deleteVideoLibrary Services  error');
        return null;
      }
    } on TimeoutException catch (_) {
      print('deleteVideoLibrary Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('deleteVideoLibrary Services Socket error');
      return null;
    } catch (e) {
      print('deleteVideoLibrary Services  Err $e');
      return null;
    }
  }
}
