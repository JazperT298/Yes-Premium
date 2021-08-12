import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/colors.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/files/files_controller.dart';
import 'package:yes_premium/routes/app_routes.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class FilesView extends StatelessWidget {
  const FilesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FilesController());
    return SafeArea(
      child: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'My Files',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            centerTitle: false,
            floating: true,
            automaticallyImplyLeading: false,
            actions: [
              Container(
                margin: EdgeInsets.only(top: 7.0, bottom: 7.0, right: 7.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: IconButton(
                  onPressed: () => Get.toNamed(AppRoutes.SEARCH),
                  icon: Icon(
                    Icons.search_rounded,
                    size: 30,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 7.0, bottom: 7.0, right: 7.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: IconButton(
                  onPressed: () {}, //=> Get.toNamed(AppRoutes.ANNOUNCEMENT),
                  icon: Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Obx(
              () => controller.isLoading.value &&
                      controller.notesdataList.length <= 0
                  ? Container(
                      height: 30.h,
                      color: Colors.grey[200],
                    )
                  : ListView.builder(
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
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
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${Get.find<GetStorageService>().appdata.read('School')}',
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${controller.notesdataList[index].notesCreatedDate}  •  ',
                                                      style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 9.sp,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.public,
                                                      color: Colors.grey[400],
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
                                                icon: const Icon(
                                                  Icons.edit,
                                                  color: Colors.green,
                                                ),
                                                onPressed: () => {},
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.redAccent,
                                                ),
                                                onPressed: () => {},
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
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "https://yestechpremium.com/assets/img/static_img/pdf.png"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                )
                                              : controller.notesdataList[index]
                                                          .notesFileExt ==
                                                      ".docx"
                                                  ? Container(
                                                      height: 50.0,
                                                      width: 50.0,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors
                                                              .grey.shade400,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(5),
                                                        ),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              "https://yestechpremium.com/assets/img/static_img/word.jpg"),
                                                          fit: BoxFit.cover,
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
                                                            border: Border.all(
                                                              color: Colors.grey
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
                                                                  "https://yestechpremium.com/assets/img/static_img/excel.jpg"),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        )
                                                      : controller
                                                                  .notesdataList[
                                                                      index]
                                                                  .notesFileExt ==
                                                              ".pptx"
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
                                                                  Radius
                                                                      .circular(
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
                                                  onPressed: () {},
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
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
    );
  }
}
