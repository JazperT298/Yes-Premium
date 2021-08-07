import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/routes/app_routes.dart';

class FacultyMeetingView extends StatelessWidget {
  const FacultyMeetingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty Meeting'),
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
    );
  }
}
