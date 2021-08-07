import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yes_premium/models/announcement.dart';
import 'package:yes_premium/modules/home/home_api.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class HomeController extends GetxController {
  final scrollController = TrackingScrollController();
  var isLoading = true.obs;
  RxList<AnnouncementData> listofAnnouncement = <AnnouncementData>[].obs;
  // RxList<Post> postList = <Post>[
  //   Post(
  //     image: 'assets/images/nayeon.jpg',
  //     name: 'Nayeon Im',
  //     caption: 'Check out these cool puppers',
  //     timeAgo: '58m',
  //     imageUrl: 'assets/images/1.jpg',
  //   ),
  //   Post(
  //     image: 'assets/images/mina.jpg',
  //     name: 'Minari',
  //     caption:
  //         'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  //     timeAgo: '3hr',
  //     imageUrl: '',
  //   ),
  //   Post(
  //     image: 'assets/images/leesooin.jpg',
  //     name: 'Soo In Lee',
  //     caption: 'This is a very good boi.',
  //     timeAgo: '8hr',
  //     imageUrl: 'assets/images/2.jpg',
  //   ),
  //   Post(
  //     image: 'assets/images/soo.jpg',
  //     name: 'Lee Soo In',
  //     caption: 'Adventure 🏔',
  //     timeAgo: '15hr',
  //     imageUrl: 'assets/images/5.jpg',
  //   ),
  //   Post(
  //     image: 'assets/images/sana.jpg',
  //     name: 'Sana Twice',
  //     caption:
  //         'More placeholder text for the soul: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  //     timeAgo: '1d',
  //     imageUrl: '',
  //   ),
  //   Post(
  //     image: 'assets/images/kirk.jpg',
  //     name: 'Kirk Hammett',
  //     caption: 'A classic.',
  //     timeAgo: '1d',
  //     imageUrl: 'assets/images/3.jpg',
  //   ),
  // ].obs;

  RxString schoolAvatar = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getAllAnnouncementBySchool();
  }

  @override
  void onReady() {
    super.onReady();
    getAllAnnouncementBySchool();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAllAnnouncementBySchool() async {
    try {
      List result = await HomeApi.getAllAnnouncementBySchool();
      if (!isLoading.value) isLoading(true);
      for (var i = 0; i < result.length; i++) {
        Map mapping = {
          "Announce_ID": result[i]['Announce_ID'],
          "Announce_School_ID": result[i]['Announce_School_ID'],
          "Announce_Details": result[i]['Announce_Details'],
          "Announce_File": result[i]['Announce_File'],
          "Announce_FileWidth": result[i]['Announce_FileWidth'],
          "Announce_FileHeight": result[i]['Announce_FileHeight'],
          "Announce_CreatedDate": result[i]['Announce_CreatedDate'],
          "Announce_FileExt": result[i]['Announce_FileExt'],
        };

        var jsonStringEncoded = jsonEncode(mapping);
        print('yawa');
        print(jsonStringEncoded);
        listofAnnouncement.add(announcementdataFromJson(jsonStringEncoded));
      }
      isLoading(false);
    } catch (e) {
      print('err $e');
    }
  }
}

// class Post {
//   String? image;
//   String? name;
//   String? caption;
//   String? timeAgo;
//   String? imageUrl;

//   Post({
//     this.image,
//     this.name,
//     this.caption,
//     this.timeAgo,
//     this.imageUrl,
//   });
// }
