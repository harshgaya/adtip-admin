import 'package:adtip_admin_panel/modules/refer_withdraw/controllers/refer_controller.dart';
import 'package:get/get.dart';

class ReferalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferController>(() => ReferController());
  }
}
