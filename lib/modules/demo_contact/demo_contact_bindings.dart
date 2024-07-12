import 'package:get/get.dart';

import 'demo_contact_controller.dart';

class DemoContact extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoContactController>(() => DemoContactController());
  }
}
