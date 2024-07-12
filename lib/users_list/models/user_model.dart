class UserModel {
  int? count;
  List<User> users;

  UserModel({required this.count, required this.users});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        count: json["counts"],
        users: json["users"] == []
            ? []
            : List<User>.from(
                json["users"].map((x) => User.fromJson(x)),
              ),
      );
}

class User {
  int? id;
  String? name;
  String? emailId;
  String? mobile;

  User({
    required this.id,
    required this.name,
    required this.emailId,
    required this.mobile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      emailId: json['emailId'],
      mobile: json['mobile_number']);
}
