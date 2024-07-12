import 'package:adtip_admin_panel/modules/channel/controller/channel_controller.dart';
import 'package:get/get.dart';

class ChannelBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChannelController>(() => ChannelController());
  }
}
