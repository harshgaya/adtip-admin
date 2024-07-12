import 'package:adtip_admin_panel/modules/qr_scan_web/controller/qr_scan_controller.dart';
import 'package:get/get.dart';

class QrScanBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrScanController>(() => QrScanController());
  }
}
