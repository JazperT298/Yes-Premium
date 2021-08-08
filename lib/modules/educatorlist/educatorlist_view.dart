import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/educatorlist/educatorlist_controller.dart';

class EducatorListView extends StatelessWidget {
  final controller = Get.put(EducatorListController());

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.search,
                            color: Theme.of(context).iconTheme.color),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        fillColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
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
                      margin: EdgeInsets.only(top: 7.0, bottom: 7.0),
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
                          size: 30,
                        ),
                      ),
                    )
                  : Container(),
            ),
            // if (GetStorageService.c.appdata.read('userName') != null)
            Obx(
              () => controller.isSearchClick.value != true
                  ? Container(
                      margin:
                          EdgeInsets.only(top: 7.0, bottom: 7.0, right: 7.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      child: IconButton(
                        onPressed: () {
                          //controller.isSearchClick.value = true;
                        }, //=> Get.toNamed(AppRoutes.ANNOUNCEMENT),
                        icon: Icon(
                          Icons.person_add,
                          size: 30,
                        ),
                      ),
                    )
                  : Container(),
            ),
            Obx(
              () => controller.isSearchClick.value == true
                  ? Container(
                      margin:
                          EdgeInsets.only(top: 7.0, bottom: 7.0, right: 7.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      child: IconButton(
                        onPressed: () {
                          controller.isSearchClick.value = false;
                        }, //=> Get.toNamed(AppRoutes.ANNOUNCEMENT),
                        icon: Icon(
                          Icons.close,
                          size: 30,
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Obx(
            () => controller.isLoading.value &&
                    controller.educatorsDataList.length <= 0
                ? Container(
                    height: 30.h,
                    color: Colors.grey[200],
                  )
                : ListView.builder(
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    //Post Header
                                    Row(
                                      children: [
                                        ClipOval(
                                          child: Image.network(
                                            '$photoDir/${controller.educatorsDataList[index].userImage}',
                                            height: 60.0,
                                            width: 60.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                            print(
                                                '${controller.educatorsDataList.length}'),
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
        ),
      ],
    );
  }
}
