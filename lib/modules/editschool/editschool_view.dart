import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/colors.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/editschool/editschool_controller.dart';
import 'package:sizer/sizer.dart';

class EditSchoolView extends StatelessWidget {
  const EditSchoolView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditSchoolController());
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Edit Profile'),
        actions: [
          MaterialButton(
              onPressed: () {
                controller.checkInput(context);
                node.unfocus();
              },
              child: Text(
                'Update',
                style: TextStyle(fontSize: 11.sp),
              )),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  color: mainColor,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: NetworkImage(
                  //         "$photoDir/${Get.find<GetStorageService>().appdata.read('Avatar')}"),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    child: GestureDetector(
                      onTap: () => controller.getImage(),
                      child: controller.attachments1.length == 0
                          ? Container(
                              alignment: Alignment(0.0, 2.7),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "$photoDir/${controller.schoolLogo.value}",
                                ),
                                radius: 80.0,
                              ),
                            )
                          : Container(
                              alignment: Alignment(0.0, 2.4),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 80.0,
                                child: CircleAvatar(
                                  backgroundImage: FileImage(
                                    controller.imageProfile!,
                                  ),
                                  radius: 79.0,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(5))),

                    // alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 12.0),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'School Information',
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
                  height: 60.0,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20.0,
                            width: 350.0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'School Name',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            width: 350.0,
                            padding: EdgeInsets.all(5.0),
                            child: TextField(
                              controller: controller.name,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ).paddingOnly(left: 10.0),
                    ],
                  ),
                ).marginSymmetric(horizontal: 12.0),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 60.0,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20.0,
                            width: 350.0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'School Address',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            width: 350.0,
                            padding: EdgeInsets.all(5.0),
                            child: TextField(
                              controller: controller.address,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ).paddingOnly(left: 10.0),
                    ],
                  ),
                ).marginSymmetric(horizontal: 12.0),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 130.0,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20.0,
                            width: 350.0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'School Details',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 100.0,
                            width: 350.0,
                            // padding: EdgeInsets.all(5.0),
                            child: TextField(
                              controller: controller.details,
                              maxLines: 5,
                              minLines: 5,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ).paddingOnly(left: 10.0),
                    ],
                  ),
                ).marginSymmetric(horizontal: 12.0),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 60.0,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20.0,
                            width: 350.0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'School Motto',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            width: 350.0,
                            padding: EdgeInsets.all(5.0),
                            child: TextField(
                              controller: controller.motto,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ).paddingOnly(left: 10.0),
                    ],
                  ),
                ).marginSymmetric(horizontal: 12.0),
                SizedBox(
                  height: 40.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(5))),

                    // alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 12.0),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Credentials',
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
                  height: 60.0,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20.0,
                            width: 350.0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Username',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            width: 350.0,
                            padding: EdgeInsets.all(5.0),
                            child: TextField(
                              controller: controller.username,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ).paddingOnly(left: 10.0),
                    ],
                  ),
                ).marginSymmetric(horizontal: 12.0),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 60.0,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20.0,
                            width: 350.0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            width: 350.0,
                            padding: EdgeInsets.all(5.0),
                            child: TextField(
                              controller: controller.password,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              keyboardType: TextInputType.name,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '********',
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ).paddingOnly(left: 10.0),
                    ],
                  ),
                ).marginSymmetric(horizontal: 12.0),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 60.0,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20.0,
                            width: 350.0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Confirm Password',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            width: 350.0,
                            padding: EdgeInsets.all(5.0),
                            child: TextField(
                              controller: controller.confirmpassword,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              keyboardType: TextInputType.name,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '********',
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ).paddingOnly(left: 10.0),
                    ],
                  ),
                ).marginSymmetric(horizontal: 12.0),
                SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
