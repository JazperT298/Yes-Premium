import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/modules/userprofile/userprofile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    Get.put(UserProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 4.h,
          //margin: EdgeInsets.only(top: 5, bottom: 5),
          child: TextField(
            maxLines: 1,
            style: TextStyle(fontSize: 17),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              filled: true,
              prefixIcon:
                  Icon(Icons.search, color: Theme.of(context).iconTheme.color),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              contentPadding: EdgeInsets.zero,
              hintText: 'Search',
            ),
          ),
        ),
      ),
    );
  }
}
