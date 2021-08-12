import 'package:get/get.dart';
import 'package:yes_premium/modules/bottomnav/bottomnav_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<OrdersController>(() => OrdersController());
    Get.put(BottomNavController());
  }
}
