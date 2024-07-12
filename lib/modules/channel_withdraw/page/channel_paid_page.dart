import 'package:adtip_admin_panel/modules/channel_withdraw/controllers/channel_withdraw_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/utils/utils.dart';

class ChannelPaidPage extends StatefulWidget {
  const ChannelPaidPage({super.key});

  @override
  State<ChannelPaidPage> createState() => _ChannelPaidPageState();
}

class _ChannelPaidPageState extends State<ChannelPaidPage> {
  final channelController = Get.put(ChannelWithdrawController());
  final searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    channelController.pagePaid = -1;
    channelController.channelWithdrawPaid.value = [];
    channelController.getChannelWithdrawalRequestPaid();
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        channelController.getChannelWithdrawalRequestPaid();
      }
    });
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300,
              //  height: 60,
              child: TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              width: 2000,
              decoration: const BoxDecoration(color: Colors.grey),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: Text('Request Id')),
                  SizedBox(width: 100, child: Text('Name')),
                  SizedBox(width: 200, child: Text('Withdraw Req Amount')),
                  SizedBox(width: 200, child: Text('UPI ID')),
                  SizedBox(width: 200, child: Text('Mobile Number')),
                  SizedBox(width: 100, child: Text('User Id')),
                  SizedBox(width: 100, child: Text('Request Date')),
                  SizedBox(width: 100, child: Text('Paid Date')),
                  SizedBox(width: 100, child: Text('Total Earnings')),
                  SizedBox(width: 100, child: Text('Total Ads Display')),
                  SizedBox(width: 100, child: Text('Total Ads View')),
                  SizedBox(width: 100, child: Text('Total Ads Like')),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => Expanded(
                  child: SizedBox(
                    width: 2000,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: channelController.channelWithdrawPaid.length,
                      itemBuilder: (BuildContext context, int index) {
                        final withdraw =
                            channelController.channelWithdrawPaid[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 100, child: Text('${withdraw.id}')),
                              SizedBox(
                                  width: 100, child: Text('${withdraw.name}')),
                              SizedBox(
                                  width: 200,
                                  child: Text(
                                      '${withdraw.withdrawRequestAmount}')),
                              SizedBox(
                                  width: 200, child: Text('${withdraw.upiId}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.mobile}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.userId}')),
                              SizedBox(
                                  width: 100, child: Text('${withdraw.time}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.paidDate}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.totalEarnings}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.totalAdsDisplay}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.totalAdsLike}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${withdraw.totalAdsView}')),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )),
            Obx(() => channelController.unpaidLoading.value
                ? const CircularProgressIndicator()
                : const SizedBox())
          ],
        ),
      ),
    );
  }
}
