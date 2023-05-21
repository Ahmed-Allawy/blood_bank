class GetUserInfo {
  String name;
  String phoneNum;
  String email;
  String bloodGroup;
  String location;

  GetUserInfo({
    required this.name,
    required this.phoneNum,
    required this.email,
    required this.bloodGroup,
    required this.location,
  });

  factory GetUserInfo.fromJson(Map<String, dynamic> json) {
    return GetUserInfo(
      name: json['name'],
      phoneNum: json['phone_num'],
      email: json['email'],
      bloodGroup: json['blood_group'],
      location: json['location'],
    );
  }
}
