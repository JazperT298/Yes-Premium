import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/videolab/videolab_controller.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';
import 'package:sizer/sizer.dart';

class VideoLabAddView extends StatelessWidget {
  const VideoLabAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideolabController());
    final node = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Add Video'),
        actions: [
          MaterialButton(
              onPressed: () {
                node.unfocus();
                if (controller.detailsEditingController.text.isEmpty) {
                  Dialogs.showMyToast(context, "Please, write the details");
                } else {
                  controller.uploadVideoLibrary(
                    context,
                    controller.imgprofile!,
                    controller.titleEditingController.text,
                    controller.detailsEditingController.text,
                    Get.find<GetStorageService>().appdata.read('SchoolId'),
                  );
                }
              },
              child: Text(
                'Upload',
                style: TextStyle(fontSize: 11.sp),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: 120.0,
          // width: double.infinity,
          padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
          // color: Colors.red,
          child: Column(
            children: [
              Row(
                children: [
                  Get.find<GetStorageService>().appdata.read('Roles') ==
                          'SchoolAdmin'
                      ? Container(
                          width: 10.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "$photoDir/${Get.find<GetStorageService>().appdata.read('SchoolAvatar')}"),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        )
                      : Container(
                          width: 10.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "$photoDir/${Get.find<GetStorageService>().appdata.read('Avatar')}"),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                  Column(
                    children: [
                      Text(
                        '${Get.find<GetStorageService>().appdata.read('School')}',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ).marginOnly(left: 10.0),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        '"Your Future, Our Pride"',
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ).marginOnly(left: 20.0),
                    ],
                  ),
                ],
              ),
              Divider(
                height: 10.0,
                thickness: 0.5,
              ),
              TextField(
                controller: controller.titleEditingController,
                decoration: InputDecoration(
                  hintText: 'Video title',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                minLines: 10,
                maxLines: 10,
                controller: controller.detailsEditingController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Video details...:',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Obx(
                () => controller.attachments.length == 0
                    ? Container()
                    : Badge(
                        position: BadgePosition.topEnd(top: -10, end: -5),
                        badgeColor: Colors.grey,
                        badgeContent: GestureDetector(
                          onTap: () {
                            controller.attachments.length = 0;
                            controller.filenamevideoprofile.value = '';
                            controller.fileTypevideoprofile.value = '';
                          },
                          child: Container(
                            width: 20,
                            height: 30,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                        ),
                        child: controller.filenamevideoprofile.value != ""
                            ? Text(
                                '${controller.filenamevideoprofile.value}',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            : Container(
                                // margin: EdgeInsets.only(left: 4.0, right: 8.0),
                                height: 180,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      5.0,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(
                                          controller.image!,
                                        ),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 7.h,
        child: Column(
          children: [
            Divider(
              height: 10.0,
              thickness: 0.5,
              color: Colors.grey.shade300,
            ),
            GestureDetector(
              onTap: () => controller.getVideo(),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.videocam,
                      size: 30,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text('Videos',
                        style: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.w600)),
                  ],
                ).paddingOnly(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
