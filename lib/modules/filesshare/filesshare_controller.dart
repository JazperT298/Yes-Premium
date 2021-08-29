import 'package:get/get.dart';
import 'package:yes_premium/modules/filesshare/filesshare_api.dart';
import 'package:yes_premium/shared/dialogs.dart';

class FilesShareController extends GetxController {
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    isLoading.value = false;
  }

  void shareNotesToUser(context, notesID, sharedUserID, ownerUserID) async {
    try {
      isLoading.value = true;
      var result = await FilesShareApi.shareNotesToUser(notesID, sharedUserID, ownerUserID);
      if (result == "Success") {
        isLoading.value = false;
        Get.back();
        Dialogs.showMyToast(context, "File successfully shared!");
      } else {
        isLoading.value = false;
        Dialogs.showErrorToast(context, "Error sharing a file!");
      }
    } catch (error) {
      print("shareNotesToUser $error");
    } finally {}
  }
}
