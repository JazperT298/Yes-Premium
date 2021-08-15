import 'package:get/get.dart';
import 'package:yes_premium/modules/filesshare/filesshare_api.dart';
import 'package:yes_premium/shared/dialogs.dart';

class FilesShareController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void shareNotesToUser(context, notesID, sharedUserID, ownerUserID) async {
    try {
      var result = await FilesShareApi.shareNotesToUser(
          notesID, sharedUserID, ownerUserID);
      if (result == "Success") {
        Get.back();
        Dialogs.showMyToast(context, "File successfully shared!");
      } else {
        Dialogs.showMyToast(context, "Error sharing a file!");
      }
    } catch (error) {
      print("shareNotesToUser $error");
    } finally {}
  }
}
