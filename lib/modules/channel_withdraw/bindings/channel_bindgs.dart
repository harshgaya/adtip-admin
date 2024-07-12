import 'package:adtip_admin_panel/modules/channel_withdraw/controllers/channel_withdraw_controller.dart';
import 'package:get/get.dart';

class ChannelWithdrawBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChannelWithdrawController>(() => ChannelWithdrawController());
  }
}
