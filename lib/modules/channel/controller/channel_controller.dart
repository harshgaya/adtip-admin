import 'package:adtip_admin_panel/modules/channel/models/channel_model.dart';
import 'package:get/get.dart';

import '../../../helpers/constants/url_constants.dart';
import '../../../helpers/utils/utils.dart';
import '../../../netwrok/network_api_services.dart';

class ChannelController extends GetxController {
  Rx<bool> isLoading = false.obs;
  Rx<bool> pageLoading = false.obs;
  final _apiServices = NetworkApiServices();
  int page = -1;
  RxList<Channel> channelList = <Channel>[].obs;

  Future<void> getChannels() async {
    try {
      page++;
      pageLoading.value = true;
      final response =
          await _apiServices.getApi('${UrlConstants.getAllChannels}$page/20');
      final ChannelModel channelModel = ChannelModel.fromJson(response);
      if (channelModel.channels.isNotEmpty) {
        channelList.addAll(channelModel.channels);
        print('withdraw request length ${channelList.length}');
      }
      pageLoading.value = false;
    } catch (e) {
      print('error $e');
      pageLoading.value = false;
      Utils.showErrorMessage('Something went wrong.');
    }
  }
}
