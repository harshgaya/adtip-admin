import 'package:adtip_admin_panel/modules/channel_withdraw/controllers/channel_withdraw_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/utils/utils.dart';

class ChannelUnpaidPage extends StatefulWidget {
  const ChannelUnpaidPage({super.key});

  @override
  State<ChannelUnpaidPage> createState() => _ChannelUnpaidPageState();
}

class _ChannelUnpaidPageState extends State<ChannelUnpaidPage> {
  final channelController = Get.put(ChannelWithdrawController());
  final searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    channelController.pageUnpaid = -1;
    channelController.channelWithdrawUnpaid.value=[];
    channelController.getChannelWithdrawalRequestUnpaid();
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        channelController.getChannelWithdrawalRequestUnpaid();
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
                  SizedBox(width: 200, child: Text('Action')),
                  SizedBox(width: 100, child: Text('Request Id')),
                  SizedBox(width: 100, child: Text('Name')),
                  SizedBox(width: 200, child: Text('Withdraw Req Amount')),
                  SizedBox(width: 200, child: Text('UPI ID')),
                  SizedBox(width: 200, child: Text('Mobile Number')),
                  SizedBox(width: 100, child: Text('User Id')),
                  SizedBox(width: 100, child: Text('Date')),
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
                      itemCount: channelController.channelWithdrawUnpaid.length,
                      itemBuilder: (BuildContext context, int index) {
                        final withdraw =
                            channelController.channelWithdrawUnpaid[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 200,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Utils.showAlertDialogYesNo(
                                          context: context,
                                          title: 'Are you sure?',
                                          function: () async {
                                            await channelController
                                                .changeUnpaidToPaidChannel(
                                                    id: withdraw.id!);

                                            channelController
                                                .channelWithdrawUnpaid
                                                .value = [];
                                            channelController.pageUnpaid = -1;
                                            await channelController
                                                .getChannelWithdrawalRequestUnpaid();
                                          },
                                          subtitle: 'User will be paid',
                                        );
                                      },
                                      child: const Text('Pay'))),
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
