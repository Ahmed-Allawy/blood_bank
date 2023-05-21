// ignore_for_file: file_names

class BloodRequest {
  final int id;
  final String user;
  final String fname;
  final String location;
  final bool approved;
  final String bloodGroup;
  final String date;
  final String time;

  BloodRequest({
    required this.id,
    required this.user,
    required this.fname,
    required this.location,
    required this.approved,
    required this.bloodGroup,
    required this.date,
    required this.time,
  });

  factory BloodRequest.fromJson(Map<String, dynamic> json) {
    return BloodRequest(
      id: json['id'],
      user: json['user'],
      fname: json['Fname'],
      location: json['location'],
      approved: json['approved'],
      bloodGroup: json['blood_group'],
      date: json['date'],
      time: json['time'],
    );
  }
}

class DonateModel {
  final int id;
  final String user;
  final String firstName;
  final String location;
  final bool approved;
  final String bloodGroup;
  final String campaign;
  final String date;
  final String time;

  DonateModel({
    required this.id,
    required this.user,
    required this.firstName,
    required this.location,
    required this.approved,
    required this.bloodGroup,
    required this.campaign,
    required this.date,
    required this.time,
  });

  // ...

  factory DonateModel.fromJson(Map<String, dynamic> json) => DonateModel(
        id: json['id'],
        user: json['user'],
        firstName: json['Fname'],
        location: json['location'],
        approved: json['approved'],
        bloodGroup: json['blood_group'],
        campaign: json['campaign'],
        date: json['date'],
        time: json['time'],
      );
}
