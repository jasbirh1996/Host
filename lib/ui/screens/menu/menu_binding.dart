import 'package:get/get.dart';
import 'view_menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ViewMenuController>(ViewMenuController());
  }
}
