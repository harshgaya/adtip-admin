import 'package:adtip_admin_panel/dashboard/controllers/dashboard_controller.dart';
import 'package:adtip_admin_panel/modules/qr_scan_web/controller/qr_scan_controller.dart';
import 'package:adtip_admin_panel/modules/qr_scan_web/pages/qr_scan_web_paid.dart';
import 'package:adtip_admin_panel/modules/qr_scan_web/pages/qr_scan_web_unpaid_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrScanAllCompany extends StatefulWidget {
  const QrScanAllCompany({super.key});

  @override
  State<QrScanAllCompany> createState() => _QrScanAllCompanyState();
}

class _QrScanAllCompanyState extends State<QrScanAllCompany> {
  final searchController = TextEditingController();
  final qrScanController = Get.put(QrScanController());
  final dashboardController = Get.put(DashboardController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qrScanController.getQrUniqueCompany();
  }

  @override
  Widget build(BuildContext context) {
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
              width: 550,
              decoration: const BoxDecoration(color: Colors.grey),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 200, child: Text('Action')),
                  SizedBox(width: 100, child: Text('Company Name')),
                  SizedBox(width: 100, child: Text('Company Id')),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => qrScanController.isLoading.value
                ? const CircularProgressIndicator()
                : Expanded(
                    child: SizedBox(
                      width: 500,
                      child: ListView.builder(
                        itemCount: qrScanController.qrCompany.length,
                        itemBuilder: (BuildContext context, int index) {
                          final qrCompany = qrScanController.qrCompany[index];
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 200,
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () async {
                                                qrScanController.page = -1;
                                                qrScanController
                                                    .qrScanUnpaid.value = [];

                                                Get.to(QrScanWebUnpaidData(
                                                  companyId:
                                                      qrCompany.companyId!,
                                                ));
                                              },
                                              child: const Text('Unpaid')),
                                          ElevatedButton(
                                              onPressed: () async {
                                                qrScanController.paidPage = -1;
                                                qrScanController
                                                    .qrScanPaid.value = [];
                                                Get.to(QrScanWebPaid(
                                                  companyId:
                                                      qrCompany.companyId!,
                                                ));
                                              },
                                              child: const Text('Paid')),
                                        ],
                                      )),
                                  SizedBox(
                                      width: 100,
                                      child: Text('${qrCompany.companyName}')),
                                  SizedBox(
                                      width: 100,
                                      child: Text('${qrCompany.companyId}')),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
