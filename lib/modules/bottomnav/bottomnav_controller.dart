import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BottomNavController extends GetxController {
  var isLoading = true.obs;
  var timeout = false.obs;

  RxInt selectedIndex = 0.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  void resetIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}
