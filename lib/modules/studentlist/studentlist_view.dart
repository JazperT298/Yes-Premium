import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/colors.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/studentlist/studentlist_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/routes/app_routes.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';
import 'package:yes_premium/shared/loading.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    final controller = Get.put(StudentListController());
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value &&
                controller.studentsDataList.length <= 0
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
                            ? Text('Student List')
                            : Container(
                                height: 4.h,
                                //margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: TextField(
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 17),
                                  textAlignVertical: TextAlignVertical.center,
                                  controller:
                                      controller.searchEditingController,
                                  textInputAction: TextInputAction.search,
                                  onSubmitted: (value) {
                                    controller.searchStudent(
                                        Get.find<GetStorageService>()
                                            .appdata
                                            .read('SchoolId'),
                                        controller
                                            .searchEditingController.text);
                                    node.unfocus();
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    prefixIcon: Icon(Icons.search,
                                        color:
                                            Theme.of(context).iconTheme.color),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    fillColor: Theme.of(context)
                                        .inputDecorationTheme
                                        .fillColor,
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
                                  margin:
                                      EdgeInsets.only(top: 6.0, bottom: 6.0),
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
                                  margin: EdgeInsets.only(
                                      top: 6.0, bottom: 6.0, right: 6.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.toNamed(AppRoutes.ADDUSER,
                                          arguments: {'UserType': 'Student'});
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
                                  margin: EdgeInsets.only(
                                      top: 6.0, bottom: 6.0, right: 6.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      controller.isSearchClick.value = false;
                                      controller.searchEditingController.text =
                                          '';
                                      controller.getAllStudentBySchoolId(1);
                                      node.unfocus();
                                    },
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
                        itemCount: controller.studentsDataList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        //Post Header
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () => Get.toNamed(
                                                AppRoutes.USERPROFILE,
                                                arguments: {
                                                  "userID": controller
                                                      .studentsDataList[index]
                                                      .userID,
                                                },
                                              ),
                                              child: ClipOval(
                                                child: Image.network(
                                                  '$photoDir/${controller.studentsDataList[index].userImage}',
                                                  height: 70.0,
                                                  width: 70.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.0,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${controller.studentsDataList[index].userLastname}, ${controller.studentsDataList[index].userFirstname}',
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    'Student ID : ${controller.studentsDataList[index].userCode} ',
                                                    style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 11.sp,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  // controller.isAccountDisabled
                                                  //             .value ==
                                                  //         false
                                                  //     ?
                                                  controller
                                                              .studentsDataList[
                                                                  index]
                                                              .lockoutEnabled ==
                                                          false
                                                      ? GestureDetector(
                                                          onTap: () => Dialogs
                                                              .showDisableAccount(
                                                            context,
                                                            controller
                                                                .studentsDataList[
                                                                    index]
                                                                .userID,
                                                          ),
                                                          // onTap: () => controller
                                                          //     .isAccountDisabled
                                                          //     .value = true,
                                                          child: Container(
                                                            height: 3.h,
                                                            width: 130,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: mainColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                'Account Enabled',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : GestureDetector(
                                                          onTap: () => Dialogs
                                                              .showEnableAccount(
                                                            context,
                                                            controller
                                                                .studentsDataList[
                                                                    index]
                                                                .userID,
                                                          ),
                                                          // onTap: () => controller
                                                          //     .isAccountDisabled
                                                          //     .value = true,
                                                          child: Container(
                                                            height: 3.h,
                                                            width: 130,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .redAccent,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                'Account Disabled',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                ],
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.green,
                                              ),
                                              onPressed: () => {
                                                print(
                                                    '${controller.studentsDataList[index].name}'),
                                                print(
                                                    '${controller.studentsDataList[index].userCode}'),
                                                print(
                                                    '${controller.studentsDataList.length}'),
                                                print(
                                                    '${controller.studentsDataList[index].lockoutEnabled}'),
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
