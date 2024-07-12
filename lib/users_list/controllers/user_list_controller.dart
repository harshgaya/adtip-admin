import 'package:adtip_admin_panel/users_list/models/user_model.dart';
import 'package:get/get.dart';

import '../../helpers/constants/url_constants.dart';
import '../../helpers/utils/utils.dart';
import '../../netwrok/network_api_services.dart';

class UserListController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> pageLoading = false.obs;
  final _apiServices = NetworkApiServices();
  int page = -1;
  RxList<User> userList = <User>[].obs;

  Future<void> getUsers() async {
    try {
      page++;
      pageLoading.value = true;
      final response =
          await _apiServices.getApi('${UrlConstants.getUsers}$page/20');
      final UserModel userModel = UserModel.fromJson(response);
      if (userModel.users.isNotEmpty) {
        userList.addAll(userModel.users);
        print('withdraw request length ${userList.length}');
      }
      pageLoading.value = false;
    } catch (e) {
      print('error $e');
      pageLoading.value = false;
      Utils.showErrorMessage('Something went wrong.');
    }
  }
}
