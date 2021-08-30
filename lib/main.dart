import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/routes/app_pages.dart';
import 'package:yes_premium/routes/app_routes.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/services/transaction_service.dart';
import 'package:yes_premium/themes/app_theme.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //_initNotificationService();
  _initGetStorageService();
  _initTransactionService();
  runApp(MyApp());
}

// Future<void> _initNotificationService() async {
//   print('init NotificationService..');
//   await Get.putAsync<NotificationService>(() async => NotificationService());
// }

void _initGetStorageService() {
  print('init get storage service..');
  Get.put(GetStorageService());
}

void _initTransactionService() {
  print('init TransactionService..');
  Get.put(TransactionService());
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          supportedLocales: [
            const Locale('en', 'US'),
          ],
          title: 'Yes Premium',
          smartManagement: SmartManagement.keepFactory,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.SPLASHSCREEN,
          getPages: AppPages.list,
          theme: AppThemes.light,
          locale: const Locale('en', 'US'),
        );
      },
    );
  }
}
