import 'package:adtip_admin_panel/modules/channel/controller/channel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({super.key});

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  final ChannelController channelController = Get.put(ChannelController());
  final searchController = TextEditingController();

  @override
  void initState() {
    channelController.getChannels();
    super.initState();
  }

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        channelController.getChannels();
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
              width: 800,
              decoration: const BoxDecoration(color: Colors.grey),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: Text('Id')),
                  SizedBox(width: 100, child: Text('Name')),
                  SizedBox(width: 100, child: Text('Subscribers')),
                  SizedBox(width: 100, child: Text('Videos')),
                  SizedBox(width: 100, child: Text('Shorts')),
                  SizedBox(width: 100, child: Text('Created By')),
                  SizedBox(width: 100, child: Text('Mobile Number')),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => Expanded(
                  child: SizedBox(
                    width: 800,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: channelController.channelList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final channel = channelController.channelList[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 100, child: Text('${channel.id}')),
                              SizedBox(
                                  width: 100, child: Text('${channel.name}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${channel.totalSubscribers}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${channel.totalVideos}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${channel.totalShorts}')),
                              SizedBox(
                                  width: 100,
                                  child: Text('${channel.createdBy}')),
                              SizedBox(
                                  width: 100,
                                  child: SelectableText(
                                      '${channel.mobileNumber}')),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )),
            Obx(() => channelController.pageLoading.value
                ? const CircularProgressIndicator()
                : const SizedBox())
          ],
        ),
      ),
    );
  }
}
