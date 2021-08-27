import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:yes_premium/colors.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/files/files_controller.dart';
import 'package:yes_premium/routes/app_routes.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';
import 'package:yes_premium/shared/loading.dart';

class FilesView extends StatelessWidget {
  const FilesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FilesController());
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value && controller.notesdataList.length <= 0
            ? LoadingView()
            : SafeArea(
                child: RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(
                      Duration(seconds: 2),
                      () async {
                        controller.getUserNotesLists();
                      },
                    );
                  },
                  child: CustomScrollView(
                    controller: controller.scrollController,
                    slivers: [
                      SliverAppBar(
                        brightness: Brightness.light,
                        backgroundColor: Colors.white,
                        title: Text(
                          'My Files',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                        centerTitle: false,
                        floating: true,
                        automaticallyImplyLeading: false,
                        actions: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 6.0, bottom: 6.0, right: 6.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300,
                            ),
                            child: IconButton(
                              onPressed: () => Get.toNamed(AppRoutes.SEARCH),
                              icon: Icon(
                                Icons.search_rounded,
                                size: 25,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 6.0, bottom: 6.0, right: 6.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300,
                            ),
                            child: IconButton(
                              onPressed: () {
                                Get.toNamed(
                                  AppRoutes.FILESADD,
                                  arguments: {
                                    'Title': 'Add Files',
                                    'Notes_ID': '',
                                    'User_ID': '',
                                    'School_ID': '',
                                    'Notes_Title': '',
                                    'Notes_Desc': '',
                                    'Notes_FileName': '',
                                    'Notes_File': null,
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.add,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: RefreshIndicator(
                          onRefresh: () {
                            return Future.delayed(
                              Duration(seconds: 2),
                              () async {
                                controller.getUserNotesLists();
                              },
                            );
                          },
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.notesdataList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            //Post Header
                                            Row(
                                              children: [
                                                ClipOval(
                                                  child: Image.network(
                                                    '$photoDir/${Get.find<GetStorageService>().appdata.read('SchoolAvatar')}',
                                                    height: 40.0,
                                                    width: 40.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.0,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${Get.find<GetStorageService>().appdata.read('School')}',
                                                        style: TextStyle(
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${controller.notesdataList[index].notesCreatedDate}  •  ',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .grey[600],
                                                              fontSize: 9.sp,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.public,
                                                            color: Colors
                                                                .grey[400],
                                                            size: 12.0,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.edit,
                                                        color: Colors.green,
                                                      ),
                                                      onPressed: () => {
                                                        print(
                                                            '${controller.notesdataList[index].notesFile}'),
                                                        Get.toNamed(
                                                          AppRoutes.FILESADD,
                                                          arguments: {
                                                            'Title':
                                                                'Update Files',
                                                            'Notes_ID': controller
                                                                .notesdataList[
                                                                    index]
                                                                .notesID,
                                                            'User_ID': controller
                                                                .notesdataList[
                                                                    index]
                                                                .userID,
                                                            'School_ID': controller
                                                                .notesdataList[
                                                                    index]
                                                                .schoolID,
                                                            'Notes_Title':
                                                                controller
                                                                    .notesdataList[
                                                                        index]
                                                                    .notesTitle,
                                                            'Notes_Desc':
                                                                controller
                                                                    .notesdataList[
                                                                        index]
                                                                    .notesDesc,
                                                            'Notes_FileName':
                                                                controller
                                                                    .notesdataList[
                                                                        index]
                                                                    .notesFileName,
                                                            'Notes_File':
                                                                controller
                                                                    .notesdataList[
                                                                        index]
                                                                    .notesFile,
                                                          },
                                                        )
                                                      },
                                                    ),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color: Colors.redAccent,
                                                      ),
                                                      onPressed: () => Dialogs
                                                          .showDeleteFile(
                                                              context,
                                                              controller
                                                                  .notesdataList[
                                                                      index]
                                                                  .notesID,
                                                              controller
                                                                  .notesdataList[
                                                                      index]
                                                                  .userID,
                                                              controller
                                                                  .notesdataList[
                                                                      index]
                                                                  .schoolID),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            //Post caption
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Row(
                                              children: [
                                                controller.notesdataList[index]
                                                            .notesFileExt ==
                                                        ".pdf"
                                                    ? Container(
                                                        height: 50.0,
                                                        width: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors
                                                                .grey.shade400,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                "https://yestechpremium.com/assets/img/static_img/pdf.png"),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      )
                                                    : controller
                                                                .notesdataList[
                                                                    index]
                                                                .notesFileExt ==
                                                            ".docx"
                                                        ? Container(
                                                            height: 50.0,
                                                            width: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                              image:
                                                                  DecorationImage(
                                                                image: NetworkImage(
                                                                    "https://yestechpremium.com/assets/img/static_img/word.jpg"),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          )
                                                        : controller
                                                                    .notesdataList[
                                                                        index]
                                                                    .notesFileExt ==
                                                                ".xlsx"
                                                            ? Container(
                                                                height: 50.0,
                                                                width: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            5),
                                                                  ),
                                                                  image:
                                                                      DecorationImage(
                                                                    image: NetworkImage(
                                                                        "https://yestechpremium.com/assets/img/static_img/excel.jpg"),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              )
                                                            : controller
                                                                        .notesdataList[
                                                                            index]
                                                                        .notesFileExt ==
                                                                    ".pptx"
                                                                ? Container(
                                                                    height:
                                                                        50.0,
                                                                    width: 50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade400,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                        Radius.circular(
                                                                            5),
                                                                      ),
                                                                      image:
                                                                          DecorationImage(
                                                                        image: NetworkImage(
                                                                            "https://yestechpremium.com/assets/img/static_img/powerpoint.jpg"),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  )
                                                                : Container(),
                                                SizedBox(
                                                  width: 15.0,
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '${controller.parseHtmlString(controller.notesdataList[index].notesTitle!)}',
                                                        style: TextStyle(
                                                            fontSize: 11.sp),
                                                      ),
                                                      RaisedButton.icon(
                                                        onPressed: () {
                                                          Get.toNamed(AppRoutes
                                                              .FILESSHARE);
                                                          print(
                                                              '${controller.notesdataList[index].notesID}');
                                                        },
                                                        elevation: 2.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        color: colorPeterriver,
                                                        icon: Icon(
                                                          Icons.share,
                                                          color: Colors.white,
                                                        ),
                                                        label: Text(
                                                          "Share",
                                                          style: TextStyle(
                                                            fontSize: 9.sp,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
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
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
