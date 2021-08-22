import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/colors.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
// import 'package:yes_premium/modules/profile/profile_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/routes/app_routes.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 4.h,
          //margin: EdgeInsets.only(top: 5, bottom: 5),
          child: TextField(
            maxLines: 1,
            style: TextStyle(fontSize: 17),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              filled: true,
              prefixIcon:
                  Icon(Icons.search, color: Theme.of(context).iconTheme.color),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              contentPadding: EdgeInsets.zero,
              hintText: 'Search',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                  child: Container(
                    alignment: Alignment(0.0, 2.7),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "$photoDir/${Get.find<GetStorageService>().appdata.read('SchoolAvatar')}",
                      ),
                      radius: 80.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                '${Get.find<GetStorageService>().appdata.read('School_Name')}',
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${Get.find<GetStorageService>().appdata.read('School_Address')}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ).marginOnly(left: 12.0, right: 12.0),
              SizedBox(
                height: 30,
              ),
              Text(
                '${Get.find<GetStorageService>().appdata.read('School_Details')}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ).marginOnly(left: 12.0, right: 12.0),
              SizedBox(
                height: 30,
              ),
              Divider(
                height: 10.0,
                thickness: 0.5,
                color: Colors.grey.shade300,
              ).marginOnly(left: 12.0, right: 12.0),
              SizedBox(
                height: 30,
              ),
              Text(
                '${Get.find<GetStorageService>().appdata.read('School_Motto')}',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w600),
              ),
              // Card(
              //   margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Expanded(
              //           child: Column(
              //             children: [
              //               Text(
              //                 "Project",
              //                 style: TextStyle(
              //                     color: Colors.blueAccent,
              //                     fontSize: 22.0,
              //                     fontWeight: FontWeight.w600),
              //               ),
              //               SizedBox(
              //                 height: 7,
              //               ),
              //               Text(
              //                 "15",
              //                 style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 22.0,
              //                     fontWeight: FontWeight.w300),
              //               )
              //             ],
              //           ),
              //         ),
              //         Expanded(
              //           child: Column(
              //             children: [
              //               Text(
              //                 "Followers",
              //                 style: TextStyle(
              //                     color: Colors.blueAccent,
              //                     fontSize: 22.0,
              //                     fontWeight: FontWeight.w600),
              //               ),
              //               SizedBox(
              //                 height: 7,
              //               ),
              //               Text(
              //                 "2000",
              //                 style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 22.0,
              //                     fontWeight: FontWeight.w300),
              //               )
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
          onPressed: () {
            Get.toNamed(
              AppRoutes.EDITSCHOOL,
              arguments: {
                "schoolID":
                    Get.find<GetStorageService>().appdata.read('School_ID'),
                "schoolName":
                    Get.find<GetStorageService>().appdata.read('School_Name'),
                "schoolLogo":
                    Get.find<GetStorageService>().appdata.read('School_Logo'),
                "schoolAddress": Get.find<GetStorageService>()
                    .appdata
                    .read('School_Address'),
                "schoolDetails": Get.find<GetStorageService>()
                    .appdata
                    .read('School_Details'),
                "schoolMotto":
                    Get.find<GetStorageService>().appdata.read('School_Motto'),
                "adminUsername": Get.find<GetStorageService>()
                    .appdata
                    .read('Admin_Username'),
              },
            );
          },
          shape: StadiumBorder(),
          child: Text(
            'Edit Your Profile',
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
