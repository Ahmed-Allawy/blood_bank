// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

//  this is the jason form the user {
//     "email": "",
//     "password": "",
//     "Fname": "",
//     "DateOfBirth": null,
//     "phone_num": "",
//     "location": "",
//     "blood_group": null
// }
class User {
  String email;
  String password;
  String Fname;
  String DateOfBirth;
  int phone_num;
  String location;
  String blood_group;
  User({
    required this.email,
    required this.password,
    required this.Fname,
    required this.DateOfBirth,
    required this.phone_num,
    required this.location,
    required this.blood_group,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'Fname': Fname,
      'DateOfBirth': DateOfBirth,
      'phone_num': phone_num,
      'location': location,
      'blood_group': blood_group,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      password: map['password'] as String,
      Fname: map['Fname'] as String,
      DateOfBirth: map['DateOfBirth'] as String,
      phone_num: map['phone_num'] as int,
      location: map['location'] as String,
      blood_group: map['blood_group'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
//blood request self / other response 
// {
//     "id": 14,
//     "user": "0123456789",
//     "Fname": "Allawy",
//     "location": "Faqous",
//     "approved": false,
//     "blood_group": null,
//     "date": "2023-05-11",
//     "time": "00:26:07.701335"
// }

//blood donate self/other response 
// {
//     "id": 3,
//     "user": "0123456789",
//     "Fname": "Allawy",
//     "location": "Faqous",
//     "approved": false,
//     "blood_group": null,
//     "date": "2023-05-11",
//     "time": "00:24:49.971764"
// }

