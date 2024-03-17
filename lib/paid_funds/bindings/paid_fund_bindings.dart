import 'package:adtip_admin_panel/paid_funds/controllers/paid_funds_controller.dart';
import 'package:get/get.dart';

class PaidFundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaidFundController>(() => PaidFundController());
  }
}
