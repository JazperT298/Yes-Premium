import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class EditSchoolApi {
  static var client = http.Client();

  static Future updateSchoolDetails(
      schoolID,
      schoolName,
      schoolLogo,
      schoolAddress,
      schoolDetails,
      schoolMotto,
      schoolAbbreviation,
      schoolCode,
      adminUsername,
      adminPassword) async {
    try {
      var response = await client.post(
          Uri.parse('$baseUrl/api/Schools/AddUpdateSchoolDetails'),
          headers: {
            "access-control-allow-origin": "*",
            'content-type': 'application/x-www-form-urlencoded',
            'Authorization':
                'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
          },
          body: {
            'School_ID': schoolID.toString(),
            'School_Name': schoolName.toString(),
            "School_Logo": schoolLogo.toString(),
            'School_Address': schoolAddress.toString(),
            'School_Details': schoolDetails.toString(),
            'School_Motto': schoolMotto.toString(),
            'School_Abbreviation': schoolAbbreviation.toString(),
            'School_Code': schoolCode.toString(),
            'Admin_Username': adminUsername.toString(),
            'Admin_Password': adminPassword.toString(),
          }).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              "getAllUserBySearchKeyword Services Connection timeout.");
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var message = jsonDecode(response.body)['Message'];
        print('message $message');
        return message;
      } else {
        print('getAllUserBySearchKeyword Services  error');
        return null;
      }
    } on TimeoutException catch (_) {
      print('updateSchoolDetails Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('updateSchoolDetails Services Socket error');
      return null;
    } catch (e) {
      print('updateSchoolDetails Services  Err $e');
      return null;
    }
  }

  static Future uploadSchoolPhoto(
    File fileToUpload,
    schoolID,
  ) async {
    try {
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Access-Control-Allow-Origin': '*',
        'Authorization':
            'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/api/Schools/UploadSchoolPhoto'));
      request.fields.addAll({
        'School_ID': schoolID.toString(),
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
    } on TimeoutException catch (_) {
      print('uploadSchoolPhoto Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('uploadSchoolPhoto Services Socket error');
      return null;
    } catch (e) {
      print('uploadSchoolPhoto Services  Err $e');
      return null;
    }
  }
}
