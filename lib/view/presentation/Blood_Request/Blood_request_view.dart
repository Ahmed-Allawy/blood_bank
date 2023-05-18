// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:blood_bank/view/presentation/Blood_Request/widgets/blood_request_view_body.dart';
import 'package:blood_bank/view/shared/network/local/cach_helper.dart';

import 'package:flutter/material.dart';
import '../../../model/model.dart';

import 'package:http/http.dart' as http;

class BloodRequestView extends StatefulWidget {
  const BloodRequestView({super.key});

  @override
  State<BloodRequestView> createState() => _BloodrequestViewState();
}

class _BloodrequestViewState extends State<BloodRequestView> {
  @override
  Widget build(BuildContext context) {
    return BloodRequestViewBody(
      email: 'dgdssd@sdgd.com',
      location: 'cdscdsdsc',
      doneOntap: () {
        setState(() {
          sendBloodRequest();

          //sendBloodRequest();
        });
      },
      phoneNumber: '0101021342',
      imageBlood: 'assets/O.png',
      personName: 'Ahmed allawy',
    );
  }
}

/// Self API (get)
/// {
/// bloog group,
/// name,
/// location,
/// phone number,
/// email
/// } i can make request blood with these info
/// to get those enfo
//  var headers = {
// };
// var request = http.Request('GET', Uri.parse('http://127.0.0.1:8000/getuser'));

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

void sendBloodRequest() async {
  var token = CacheHelper.getData(key: 'token');
  print(token);
  var headers = {'Authorization': 'Token $token'};
  var request = http.Request(
      'GET', Uri.parse('http://127.0.0.1:8000/blood/user/blood-requests/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

String token() {
  return CacheHelper.getData(key: 'token');
}

// // this is the user entery
// var user = User(
//   email: 'example@example.com',
//   password: 'password',
//   Fname: 'John Doe',
//   DateOfBirth: '1990-01-01',
//   phone_num: 123456789,
//   location: 'New York',
//   blood_group: 'O+',
// );
