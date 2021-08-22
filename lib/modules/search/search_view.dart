import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/search/search_controller.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController());
    final node = FocusScope.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 4.h,
          //margin: EdgeInsets.only(top: 5, bottom: 5),
          child: TextField(
            maxLines: 1,
            style: TextStyle(fontSize: 17),
            controller: controller.searchEditingController,
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              controller.getAllUserBySearchKeyword(
                  Get.find<GetStorageService>().appdata.read('SchoolId'),
                  controller.searchEditingController.text);
            },
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
        // actions: [
        //   MaterialButton(
        //       onPressed: () {
        //         node.unfocus();
        //         controller.getAllUserBySearchKeyword(
        //             Get.find<GetStorageService>().appdata.read('SchoolId'),
        //             controller.searchEditingController.text);
        //       },
        //       child: Text(
        //         'Search',
        //         style: TextStyle(fontSize: 11.sp),
        //       )),
        // ],
      ),
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.userSearchList.length,
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
                              ClipOval(
                                child: Image.network(
                                  '$photoDir/${controller.userSearchList[index].userImage}',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.userSearchList[index].userLastname}, ${controller.userSearchList[index].userFirstname}',
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
                                          'Position : ${controller.userSearchList[index].userPosition} ',
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
                                  print('${controller.userSearchList.length}'),
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
    );
  }
}
