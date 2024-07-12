import 'package:adtip_admin_panel/modules/ad_orders/controllers/ad_order_controller.dart';
import 'package:get/get.dart';

class AdModelBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdOrderController>(() => AdOrderController());
  }
}
