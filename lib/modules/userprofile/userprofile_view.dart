import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/colors.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/userprofile/userprofile_controller.dart';
import 'package:yes_premium/shared/loading.dart';

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
              prefixIcon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
              border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(30))),
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              contentPadding: EdgeInsets.zero,
              hintText: 'Search',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(
            () => controller.isLoading.value == false
                ? Column(
                    children: [
                      Container(
                        // color: mainColor,
                        decoration: controller.userCoverImage.value != 'null'
                            ? BoxDecoration(
                                color: mainColor,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "$photoDir/${controller.userCoverImage.value}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : BoxDecoration(
                                color: mainColor,
                              ),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          child: Container(
                            alignment: Alignment(0.0, 4.6),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                "$photoDir/${controller.userImage.value}",
                              ),
                              radius: 80.0,
                            ),
                          ),
                        ),
                      ),
                      userInformation(context),
                      userBackground(context),
                      socialAccount(context),
                      SizedBox(
                        height: 100.0,
                      ),
                    ],
                  )
                : LoadingView(),
          ),
        ),
      ),
    );
  }

  Widget userInformation(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.all(Radius.circular(5))),

            // alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 12.0),
            padding: EdgeInsets.all(8.0),
            child: Text(
              'User Information',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Firstname',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userFirstname.value != 'null'
                  ? Text(
                      "${controller.userFirstname.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lastname',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userLastname.value != 'null'
                  ? Text(
                      "${controller.userLastname.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Middlename',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userMiddlename.value != 'null'
                  ? Text(
                      "${controller.userMiddlename.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userAddress.value != 'null'
                  ? Text(
                      "${controller.userAddress.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userEmail.value != 'null'
                  ? Text(
                      "${controller.userEmail.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Birthday',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userBirthday.value != 'null'
                  ? Text(
                      "${controller.userBirthday.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
      ],
    );
  }

  Widget userBackground(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.all(Radius.circular(5))),

            // alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 12.0),
            padding: EdgeInsets.all(8.0),
            child: Text(
              'User Background',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Educational Attainment',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userEducationalAttainment.value != 'null'
                  ? Text(
                      "${controller.userEducationalAttainment.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Subject Major',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userSubjMajor.value != 'null'
                  ? Text(
                      "${controller.userSubjMajor.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Position',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userPosition.value != 'null'
                  ? Text(
                      "${controller.userPosition.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
      ],
    );
  }

  Widget socialAccount(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.all(Radius.circular(5))),

            // alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 12.0),
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Social Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Facebook',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userFacebook.value != 'null'
                  ? Text(
                      "${controller.userFacebook.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Instagram',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userInstagram.value != 'null'
                  ? Text(
                      "${controller.userInstagram.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Zoom',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userZoom.value != 'null'
                  ? Text(
                      "${controller.userZoom.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Twitter',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userTwitter.value != 'null'
                  ? Text(
                      "${controller.userTwitter.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: mainColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                5.0,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Skype',
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              controller.userSkype.value != 'null'
                  ? Text(
                      "${controller.userSkype.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ).paddingOnly(left: 10.0),
        ).paddingOnly(left: 10.0, right: 10.0),
      ],
    );
  }
}
