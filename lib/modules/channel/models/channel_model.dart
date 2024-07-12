class ChannelModel {
  int? count;
  List<Channel> channels;

  ChannelModel({required this.count, required this.channels});
  factory ChannelModel.fromJson(Map<String, dynamic> json) => ChannelModel(
        count: json["counts"],
        channels: json["channels"] == []
            ? []
            : List<Channel>.from(
                json["channels"].map((x) => Channel.fromJson(x)),
              ),
      );
}

class Channel {
  int? id;
  String? name;
  int? totalSubscribers;
  int? totalVideos;
  int? totalShorts;
  int? createdBy;
  dynamic mobileNumber;

  Channel(
      {required this.id,
      required this.name,
      required this.totalSubscribers,
      required this.totalVideos,
      required this.totalShorts,
      required this.mobileNumber,
      required this.createdBy});

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
      id: json['channel_id'],
      name: json['channel_name'],
      totalSubscribers: json['total_subscribers'],
      totalVideos: json['total_videos'],
      totalShorts: json['total_shorts'],
      createdBy: json['createdby'],
      mobileNumber: json['mobile_number']);
}
