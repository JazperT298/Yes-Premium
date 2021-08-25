import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class AddUserApi {
  static var client = http.Client();
  static Future addUserDetails(
    userSchoolID,
    userCode,
    userFirstname,
    userLastname,
    userMiddlename,
    userAddress,
    userGender,
    userImage,
    userEducationalAttainment,
    userSubjMajor,
    userPosition,
    userFacebook,
    userTwitter,
    userInstagram,
    userEmail,
    userSkype,
    userZoom,
    userMotto,
    userNickname,
    userDreamjob,
    userYear,
    userType,
    parentFullname,
    parentEmail,
    parentContactNumber,
  ) async {
    try {
      var response = await client
          .post(Uri.parse('$baseUrl/api/Users/AddUpdateUserDetails'), headers: {
        "access-control-allow-origin": "*",
        'content-type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
      }, body: {
        "User_SchoolID": userSchoolID.toString(),
        "User_Code": userCode.toString(),
        "User_Firstname": userFirstname.toString(),
        "User_Lastname": userLastname.toString(),
        "User_Middlename": userMiddlename.toString(),
        "User_Address": userAddress.toString(),
        "User_Gender": userGender.toString(),
        "User_Image": userGender.toString(),
        "User_EducationalAttainment": userEducationalAttainment.toString(),
        "User_SubjMajor": userSubjMajor.toString(),
        "User_Position": userPosition.toString(),
        "User_Facebook": userFacebook.toString(),
        "User_Twitter": userTwitter.toString(),
        "User_Instagram": userInstagram.toString(),
        "User_Email": userEmail.toString(),
        "User_Skype": userSkype.toString(),
        "User_Zoom": userZoom.toString(),
        "User_Motto": userMotto.toString(),
        "User_Nickname": userNickname.toString(),
        "User_Dreamjob": userDreamjob.toString(),
        "User_Year": userYear.toString(),
        "User_Type": userType.toString(),
        "Parent_Fullname": parentFullname.toString(),
        "Parent_Email": parentEmail.toString(),
        "Parent_ContactNumber": parentContactNumber.toString(),
      }).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException("addUserDetails Services Connection timeout.");
        },
      );
      print('${response.body}');
      if (response.statusCode == 200) {
        var message = json.decode(response.body)['Message'];
        print('$message');
        return message;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print('addUserDetails Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('addUserDetails Services Socket error');
      return null;
    } catch (e) {
      print('addUserDetails Services  Err $e');
      return null;
    }
  }

  static Future updateUserDetails(
    userID,
    userSchoolID,
    userCode,
    userFirstname,
    userLastname,
    userMiddlename,
    userAddress,
    userGender,
    userImage,
    userEducationalAttainment,
    userSubjMajor,
    userPosition,
    userFacebook,
    userTwitter,
    userInstagram,
    userEmail,
    userSkype,
    userZoom,
    userMotto,
    userNickname,
    userDreamjob,
    userYear,
    userType,
    parentFullname,
    parentEmail,
    parentContactNumber,
  ) async {
    try {
      var response = await client
          .post(Uri.parse('$baseUrl/api/Users/AddUpdateUserDetails'), headers: {
        "access-control-allow-origin": "*",
        'content-type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
      }, body: {
        "User_ID": userID.toString(),
        "User_SchoolID": userSchoolID.toString(),
        "User_Code": userCode.toString(),
        "User_Firstname": userFirstname.toString(),
        "User_Lastname": userLastname.toString(),
        "User_Middlename": userMiddlename.toString(),
        "User_Address": userAddress.toString(),
        "User_Gender": userGender.toString(),
        "User_Image": userGender.toString(),
        "User_EducationalAttainment": userEducationalAttainment.toString(),
        "User_SubjMajor": userSubjMajor.toString(),
        "User_Position": userPosition.toString(),
        "User_Facebook": userFacebook.toString(),
        "User_Twitter": userTwitter.toString(),
        "User_Instagram": userInstagram.toString(),
        "User_Email": userEmail.toString(),
        "User_Skype": userSkype.toString(),
        "User_Zoom": userZoom.toString(),
        "User_Motto": userMotto.toString(),
        "User_Nickname": userNickname.toString(),
        "User_Dreamjob": userDreamjob.toString(),
        "User_Year": userYear.toString(),
        "User_Type": userType.toString(),
        "Parent_Fullname": parentFullname.toString(),
        "Parent_Email": parentEmail.toString(),
        "Parent_ContactNumber": parentContactNumber.toString(),
      }).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              "updateUserDetails Services Connection timeout.");
        },
      );
      print('${response.body}');
      if (response.statusCode == 200 && json.decode(response.body)['Success']) {
        return response.body;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print('updateUserDetails Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('updateUserDetails Services Socket error');
      return null;
    } catch (e) {
      print('updateUserDetails Services  Err $e');
      return null;
    }
  }

  static Future uploadUserPhoto(
    File fileToUpload,
    userId,
  ) async {
    try {
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Access-Control-Allow-Origin': '*',
        'Authorization':
            'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/api/Users/UploadUserPhoto'));
      request.fields.addAll({
        'UserId': userId.toString(),
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
      print('uploadUserPhoto Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('uploadUserPhoto Services Socket error');
      return null;
    } catch (e) {
      print('uploadUserPhoto Services  Err $e');
      return null;
    }
  }

  static Future uploadUserCoverPhoto(
    File fileToUpload,
    userId,
  ) async {
    try {
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Access-Control-Allow-Origin': '*',
        'Authorization':
            'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/api/Users/UploadUserCoverPhoto'));
      request.fields.addAll({
        'UserId': userId.toString(),
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
      print('uploadUserCoverPhoto Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('uploadUserCoverPhoto Services Socket error');
      return null;
    } catch (e) {
      print('uploadUserCoverPhoto Services  Err $e');
      return null;
    }
  }

  static Future changeUserCredentials(
    userID,
    userName,
    password,
  ) async {
    try {
      var response = await client
          .post(Uri.parse('$baseUrl/api/Users/ChangeUserCredential'), headers: {
        "access-control-allow-origin": "*",
        'content-type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer ${Get.find<GetStorageService>().appdata.read('access_token').toString()}',
      }, body: {
        "Id": userID.toString(),
        "UserName": userName.toString(),
        "Password": password.toString(),
      }).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              "changeUserCredentials Services Connection timeout.");
        },
      );
      if (response.statusCode == 200 && json.decode(response.body)['Success']) {
        return response.body;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print('changeUserCredentials Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('changeUserCredentials Services Socket error');
      return null;
    } catch (e) {
      print('changeUserCredentials Services  Err $e');
      return null;
    }
  }
}
