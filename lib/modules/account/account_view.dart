import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/colors.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/account/account_controller.dart';
import 'package:yes_premium/routes/app_routes.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';
import 'package:sizer/sizer.dart';

class AccountView extends GetView<AccountController> {
  final TextStyle whiteText = TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    Get.put(AccountController());
    return SafeArea(
      child: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'Menu',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            centerTitle: false,
            floating: true,
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
            ],
          ),
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.PROFILE),
              child: Card(
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {},
                          child: _buildTile(
                            color: toungeColor,
                            icon: Icons.video_label,
                            title: "Video Library",
                          ),
                        ),
                      ),
                      SizedBox(width: 15.0),
                      Expanded(
                        child: GestureDetector(
                          child: _buildTile(
                            color: colorPeterriver,
                            icon: Icons.chat_bubble,
                            title: "Faculty Meeting",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.EDUCATORLIST),
                          child: _buildTile(
                            color: newbackgroundColor,
                            icon: Icons.person,
                            title: "Educator List",
                          ),
                        ),
                      ),
                      SizedBox(width: 15.0),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.STUDENTLIST),
                          child: _buildTile(
                            color: Colors.redAccent,
                            icon: Icons.note,
                            title: "Student List",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {},
                          child: _buildTile(
                            color: mainColor,
                            icon: Icons.note,
                            title: "Files",
                          ),
                        ),
                      ),
                      SizedBox(width: 15.0),
                      Expanded(
                        child: GestureDetector(
                          child: _buildTile(
                            color: Colors.purple,
                            icon: Icons.note,
                            title: "Groups",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {},
                          child: _buildTile(
                            color: colorGrey,
                            icon: Icons.calendar_today,
                            title: "Events",
                          ),
                        ),
                      ),
                      SizedBox(width: 15.0),
                      Expanded(
                        child: GestureDetector(
                          child: _buildTile(
                            color: taglineColor,
                            icon: Icons.group_work,
                            title: "Pages",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Divider(
                  height: 10.0,
                  thickness: 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('Help & Support',
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_down_sharp),
                  ],
                ).paddingOnly(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                Divider(
                  height: 10.0,
                  thickness: 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('Settings & Privacy',
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_down_sharp),
                  ],
                ).paddingOnly(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                Container(
                  height: 5.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  margin: EdgeInsets.only(
                    left: 12.0,
                    right: 12.0,
                    top: 2.h,
                    bottom: 2.h,
                  ),
                  child: MaterialButton(
                    onPressed: () => Dialogs.showLogout(context),
                    shape: StadiumBorder(),
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildTile({Color? color, IconData? icon, String? title}) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
          Text(
            title!,
            style: whiteText.copyWith(
                fontWeight: FontWeight.bold, fontSize: 11.sp),
          ),
        ],
      ),
    );
  }
}
