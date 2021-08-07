import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/announcement/announcement_controller.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class AnnouncementView extends StatelessWidget {
  const AnnouncementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AnnouncementController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Create Announcement'),
        actions: [
          MaterialButton(
              onPressed: () {},
              child: Text(
                'Post',
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${Get.find<GetStorageService>().appdata.read('School')}',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ).marginOnly(left: 20.0),
                      SizedBox(
                        height: 4.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'View your profile',
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                height: 10.0,
                thickness: 0.5,
              ),
              TextField(
                minLines: 20,
                maxLines: 20,
                controller: controller.detailsEditingController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Please, write the details:',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 13.h,
        child: Column(
          children: [
            Divider(
              height: 10.0,
              thickness: 0.5,
              color: Colors.grey.shade300,
            ),
            GestureDetector(
              onTap: () => controller.getImage(),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.photo_library,
                      color: Colors.green,
                      size: 30,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text('Photos',
                        style: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.w600)),
                  ],
                ).paddingOnly(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
              ),
            ),
            Divider(
              height: 10.0,
              thickness: 0.5,
              color: Colors.grey.shade300,
            ),
            Container(
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
          ],
        ),
      ),
    );
  }
}
