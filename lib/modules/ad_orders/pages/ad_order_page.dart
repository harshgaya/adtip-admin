import 'package:adtip_admin_panel/helpers/utils/utils.dart';
import 'package:adtip_admin_panel/modules/ad_orders/controllers/ad_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AdOrderPage extends StatefulWidget {
  const AdOrderPage({super.key});

  @override
  State<AdOrderPage> createState() => _AdOrderPageState();
}

class _AdOrderPageState extends State<AdOrderPage> {
  final controller = Get.put(AdOrderController());
  ScrollController scrollController = ScrollController();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.getAdOrders();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        controller.getAdOrders();
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
              width: 2500,
              decoration: const BoxDecoration(color: Colors.grey),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: Text('Id')),
                  SizedBox(width: 100, child: Text('Company Name')),
                  SizedBox(width: 100, child: Text('Target Area')),
                  SizedBox(width: 100, child: Text('Total Target Per Day')),
                  SizedBox(width: 100, child: Text('Per Day Pay')),
                  SizedBox(width: 100, child: Text('Total Views')),
                  SizedBox(width: 100, child: Text('Total Likes')),
                  SizedBox(width: 100, child: Text('Start Date')),
                  SizedBox(width: 100, child: Text('End Date')),
                  SizedBox(width: 100, child: Text('Video')),
                  SizedBox(width: 100, child: Text('Paid')),
                  SizedBox(width: 100, child: Text('Website')),
                  SizedBox(width: 100, child: Text('Ad Value')),
                  SizedBox(width: 100, child: Text('Ad Total Value')),
                  SizedBox(width: 100, child: Text('Active')),
                  SizedBox(width: 100, child: Text('Available Balance')),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => Expanded(
                  child: SizedBox(
                    width: 2500,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: controller.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        final adOrder = controller.list[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 100, child: Text('${adOrder.id}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${adOrder.companyName}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${adOrder.targetArea}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${adOrder.totalTargetPerDay}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${adOrder.perDayPay}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${adOrder.totalViews}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${adOrder.totalLikes}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${adOrder.startDate}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${adOrder.endDate}')),
                              InkWell(
                                onTap: () {
                                  Utils.launchWeb(adOrder.video);
                                },
                                child: SizedBox(
                                    width: 100,
                                    child: Text('${adOrder.video}')),
                              ),
                              SizedBox(
                                  width: 100,
                                  child: Text(adOrder.isThirdPageSave == 1
                                      ? 'Yes'
                                      : 'No')),
                              InkWell(
                                onTap: () {
                                  Utils.launchWeb(adOrder.website);
                                },
                                child: SizedBox(
                                    width: 100,
                                    child: Text('${adOrder.website}')),
                              ),
                              SizedBox(
                                  width: 100,
                                  child: Text('${adOrder.adValue}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${adOrder.adTotalValue}')),
                              SizedBox(
                                  width: 100,
                                  child: Text(
                                      adOrder.isActive == 1 ? 'Yes' : 'No')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${adOrder.pendingBalance}')),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : const SizedBox())
          ],
        ),
      ),
    );
  }
}
