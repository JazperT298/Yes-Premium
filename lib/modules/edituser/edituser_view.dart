import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/colors.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/edituser/edituser_controller.dart';
import 'package:yes_premium/shared/loading.dart';

class EditUserView extends GetView<EditUserController> {
  const EditUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditUserController());
    final _node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Edit User'),
        actions: [
          MaterialButton(
              onPressed: () {
                controller.userType.value == "Student" ? controller.checkStudentInput(context) : controller.checkEducatorInput(context);
                // print('${controller.usernameEditingController.text}');
                _node.unfocus();
              },
              child: Text(
                'Update',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value == false
            ? SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //controller.getCoverImage();
                        },
                        child: Container(
                          decoration:
                              // controller.userCoverImage.value != 'null'
                              //     ? BoxDecoration(
                              //         border: Border.all(color: Colors.grey),
                              //         image: DecorationImage(
                              //           image: NetworkImage(
                              //             "$photoDir/${controller.userCoverImage.value}",
                              //           ),
                              //           fit: BoxFit.cover,
                              //         ))
                              //     :
                              BoxDecoration(
                            color: mainColor,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            child: GestureDetector(
                              onTap: () => controller.getProfileImage(),
                              child: controller.attachments2.length == 0
                                  ? Container(
                                      alignment: Alignment(0.0, 4.6),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius: 80.0,
                                        // child: Text('Add Photo'),
                                        backgroundImage: NetworkImage(
                                          "$photoDir/${controller.userImage.value}",
                                        ),
                                      ),
                                    )
                                  : Container(
                                      alignment: Alignment(0.0, 4.6),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius: 80.0,
                                        child: CircleAvatar(
                                          backgroundImage: FileImage(
                                            controller.profileImage!,
                                          ),
                                          radius: 79.0,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ).paddingOnly(bottom: 20.0),
                      ),
                      userInformation(context),
                      parentInformation(context),
                      userBackground(context),
                      socialAccounts(context),
                      userCredentials(context),
                      SizedBox(
                        height: 100.0,
                      )
                    ],
                  ),
                ),
              )
            : LoadingView(),
      ),
    );
  }

  Widget userInformation(BuildContext context) {
    final _node = FocusScope.of(context);
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
        controller.usernameEditingController.text != 'null'
            ? TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                ),
                controller: controller.usernameEditingController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => _node.nextFocus(),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mainColor, width: 1.0),
                  ),
                  labelText: 'Student ID (Required)',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(
                    left: 10.0,
                    top: 5.0,
                    right: 5.0,
                    bottom: 5.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0)
            : Container(),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.firstnameEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Firstname (Required)',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.lastnameEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Lastname (Required)',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.middlenameEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Middlename',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.addressEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Address',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.emailEditingController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Email (Required)',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.bithdayEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Birthday',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
      ],
    );
  }

  Widget parentInformation(BuildContext context) {
    final _node = FocusScope.of(context);
    return Column(
      children: [
        SizedBox(
          height: 25.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.all(Radius.circular(5))),

            // alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 12.0),
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Parents Information',
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
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.parentfullnameEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: controller.userType.value == "Student" ? 'Parents Fullname (Required)' : 'Parents Fullname',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.parentemailEditingController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: controller.userType.value == "Student" ? 'Parents Email {Required}' : 'Parets Email',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.parentcontactnoEditingController,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: controller.userType.value == "Student" ? 'Parents Contact # (Required)' : 'Parents Contact #',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
      ],
    );
  }

  Widget userBackground(BuildContext context) {
    final _node = FocusScope.of(context);
    return Column(
      children: [
        SizedBox(
          height: 25.0,
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
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.educationalAttainmentEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Educational Attainment',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.subjectmajorEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Subject Major',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.positionEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Position',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.nicknameEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Nickname',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.dreamjobEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Dream job',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.yearEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Year',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
      ],
    );
  }

  Widget socialAccounts(BuildContext context) {
    final _node = FocusScope.of(context);
    return Column(
      children: [
        SizedBox(
          height: 25.0,
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
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.facebookEditingController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Facebook',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.twitterEditingController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Twitter',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.instagramEditingController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Instagram',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.emailsEditingController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Gmail',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.skypeEditingController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Skype',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
        TextField(
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
          controller: controller.zoomEditingController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => _node.nextFocus(),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mainColor, width: 1.0),
            ),
            labelText: 'Zoom',
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.only(
              left: 10.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ).paddingOnly(left: 10.0, right: 10.0, bottom: 12.0),
      ],
    );
  }

  Widget userCredentials(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.all(Radius.circular(5))),

            // alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 12.0),
            padding: EdgeInsets.all(8.0),
            child: Text(
              'User Credentials',
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
                      controller: controller.usernameEditingController,
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
                      controller: controller.passwordEditingController,
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
                      controller: controller.confirmpasswordEditingController,
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
      ],
    );
  }
}
