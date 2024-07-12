import 'package:adtip_admin_panel/modules/demo_contact/demo_contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoContactPage extends StatefulWidget {
  const DemoContactPage({super.key});

  @override
  State<DemoContactPage> createState() => _DemoContactPageState();
}

class _DemoContactPageState extends State<DemoContactPage> {
  final controller = Get.put(DemoContactController());
  ScrollController scrollController = ScrollController();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.getDemoContactList();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        controller.getDemoContactList();
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
                  SizedBox(width: 200, child: Text('Id')),
                  SizedBox(width: 100, child: Text('Name')),
                  SizedBox(width: 100, child: Text('Mobile')),
                  SizedBox(width: 100, child: Text('Message')),
                  SizedBox(width: 100, child: Text('Type')),
                  SizedBox(width: 100, child: Text('Date')),
                  SizedBox(width: 200, child: Text('Company Name')),
                  SizedBox(width: 150, child: Text('Country')),
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
                      itemCount: controller.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        final demoContact = controller.list[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 100, child: Text('${demoContact.id}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${demoContact.name}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${demoContact.mobile}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${demoContact.message}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${demoContact.type}')),
                              SizedBox(
                                  width: 200,
                                  child: Text('${demoContact.time}')),
                              SizedBox(
                                  width: 150,
                                  child: Text('${demoContact.companyName}')),
                              SizedBox(
                                  width: 200,
                                  child: Text('${demoContact.country}')),
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
