import 'package:adtip_admin_panel/modules/demo_contact/demo_contact_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../helpers/constants/url_constants.dart';
import '../../netwrok/network_api_services.dart';

class DemoContactController extends GetxController {
  int page = -1;
  Rx<bool> isLoading = false.obs;
  final _apiServices = NetworkApiServices();
  List<DemoContactModel> list = <DemoContactModel>[].obs;

  Future<void> getDemoContactList() async {
    try {
      page++;
      isLoading.value = true;
      final response =
          await _apiServices.getApi('${UrlConstants.getDemoContact}$page/20');
      final DemoContact demoContact = DemoContact.fromJson(response);
      if (demoContact.data.isNotEmpty) {
        if (kDebugMode) {
          print('length book demo ${list.length}');
        }
        list.addAll(demoContact.data);
      }
      isLoading.value = false;
    } catch (e) {
      if (kDebugMode) {
        print('error contact demo $e');
      }
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
