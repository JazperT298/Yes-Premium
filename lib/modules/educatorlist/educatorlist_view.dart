import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/educatorlist/educatorlist_controller.dart';
import 'package:yes_premium/routes/app_routes.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/loading.dart';

class EducatorListView extends StatelessWidget {
  final controller = Get.put(EducatorListController());

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value == true && controller.educatorsDataList.length <= 0
            ? LoadingView()
            : SafeArea(
                child: CustomScrollView(
                  controller: controller.scrollController,
                  slivers: [
                    SliverAppBar(
                      brightness: Brightness.light,
                      backgroundColor: Colors.white,
                      title: Obx(
                        () => controller.isSearchClick.value != true
                            ? Text('Educator List')
                            : Container(
                                height: 4.h,
                                //margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: TextField(
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 17),
                                  textAlignVertical: TextAlignVertical.center,
                                  controller: controller.searchEditingController,
                                  textInputAction: TextInputAction.search,
                                  onSubmitted: (value) {
                                    controller.searchEducator(
                                        Get.find<GetStorageService>().appdata.read('SchoolId'), controller.searchEditingController.text);
                                    node.unfocus();
                                  },
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
                      centerTitle: false,
                      floating: true,
                      actions: [
                        Obx(
                          () => controller.isSearchClick.value != true
                              ? Container(
                                  margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      controller.isSearchClick.value = true;
                                    },
                                    icon: Icon(
                                      Icons.search_rounded,
                                      size: 25,
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                        // if (GetStorageService.c.appdata.read('userName') != null)
                        Obx(
                          () => controller.isSearchClick.value != true
                              ? Container(
                                  margin: EdgeInsets.only(top: 6.0, bottom: 6.0, right: 6.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.toNamed(AppRoutes.ADDUSER, arguments: {'UserType': 'Educator'});
                                      //controller.isSearchClick.value = true;
                                    }, //=> Get.toNamed(AppRoutes.ANNOUNCEMENT),
                                    icon: Icon(
                                      Icons.person_add,
                                      size: 25,
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                        Obx(
                          () => controller.isSearchClick.value == true
                              ? Container(
                                  margin: EdgeInsets.only(top: 6.0, bottom: 6.0, right: 6.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      controller.isSearchClick.value = false;
                                      controller.searchEditingController.text = '';
                                      controller.getAllEducatorBySchoolId(1);
                                      node.unfocus();
                                    }, //=> Get.toNamed(AppRoutes.ANNOUNCEMENT),
                                    icon: Icon(
                                      Icons.close,
                                      size: 25,
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.educatorsDataList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        //Post Header
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () => Get.toNamed(
                                                AppRoutes.USERPROFILE,
                                                arguments: {
                                                  "userID": controller.educatorsDataList[index].userID,
                                                },
                                              ),
                                              child: ClipOval(
                                                child: Image.network(
                                                  '$photoDir/${controller.educatorsDataList[index].userImage}',
                                                  height: 60.0,
                                                  width: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${controller.educatorsDataList[index].userLastname}, ${controller.educatorsDataList[index].userFirstname}',
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Position : ${controller.educatorsDataList[index].userPosition} ',
                                                        style: TextStyle(
                                                          color: Colors.grey[600],
                                                          fontSize: 11.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.green,
                                              ),
                                              onPressed: () => {
                                                Get.toNamed(
                                                  AppRoutes.EDITUSER,
                                                  arguments: {
                                                    "User_ID": controller.educatorsDataList[index].userID,
                                                    // "User_SchoolID": controller.educatorsDataList[index].userSchoolID,
                                                    // "User_Code": controller.educatorsDataList[index].userCode,
                                                    // "User_Firstname": controller.educatorsDataList[index].userFirstname,
                                                    // "User_Lastname": controller.educatorsDataList[index].userLastname,
                                                    // "User_Middlename": controller.educatorsDataList[index].userMiddlename,
                                                    // "User_Address": controller.educatorsDataList[index].userAddress,
                                                    // "User_Gender": controller.educatorsDataList[index].userGender,
                                                    // "User_Image": controller.educatorsDataList[index].userImage,
                                                    // "User_EducationalAttainment": controller.educatorsDataList[index].userEducationalAttainment,
                                                    // "User_SubjMajor": controller.educatorsDataList[index].userSubjMajor,
                                                    // "User_Position": controller.educatorsDataList[index].userPosition,
                                                    // "User_Facebook": controller.educatorsDataList[index].userFacebook,
                                                    // "User_Twitter": controller.educatorsDataList[index].userTwitter,
                                                    // "User_Instagram": controller.educatorsDataList[index].userInstagram,
                                                    // "User_Email": controller.educatorsDataList[index].userEmail,
                                                    // "User_Skype": controller.educatorsDataList[index]..userSkype,
                                                    // "User_Zoom": controller.educatorsDataList[index].userZoom,
                                                    // "User_Motto": controller.educatorsDataList[index].userMotto,
                                                    // "User_Nickname": controller.educatorsDataList[index].userNickname,
                                                    // "User_Dreamjob": controller.educatorsDataList[index].userDreamjob,
                                                    // "User_Year": controller.educatorsDataList[index].userYear,
                                                    // "User_Type": controller.educatorsDataList[index].userType,
                                                    // "Parent_Fullname": controller.educatorsDataList[index].parentFullname,
                                                    // "Parent_Email": controller.educatorsDataList[index].parentEmail,
                                                    // "Parent_ContactNumber": controller.educatorsDataList[index].parentContactNumber,
                                                  },
                                                ),
                                                print('${controller.educatorsDataList[index].userID}'),
                                                print('${controller.educatorsDataList[index].userMiddlename}'),
                                                print('${controller.educatorsDataList[index].userTwitter}'),
                                                print('${controller.educatorsDataList.length}'),
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
