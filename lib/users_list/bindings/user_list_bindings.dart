import 'package:adtip_admin_panel/users_list/controllers/user_list_controller.dart';
import 'package:adtip_admin_panel/withdrawal_requests/withdrawal_requests_controller/withdrawal_request_controller.dart';
import 'package:get/get.dart';

class WithdrawalRequestBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserListController>(() => UserListController());
  }
}
