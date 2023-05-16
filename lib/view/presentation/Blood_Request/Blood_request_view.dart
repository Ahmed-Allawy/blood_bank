// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:blood_bank/view/presentation/Blood_Request/widgets/blood_request_view_body.dart';

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
          print("object");
          // sendBloodRequest();
          // signup(user);
          sendBloodRequest();
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
//   'Authorization': 'Token a5fd5ff9e485f4938c0bd3606c1d5060c7e63821'
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
  var headers = {
    'Authorization': 'Token 7a205b729e056c374273c270d8ef97b79b87116f'
  };
  var request = http.Request(
      'GET', Uri.parse('http://127.0.0.1:8000/blood/all/blood-requests/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void signup(User user) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse('http://127.0.0.1:8000/singup/'));
  request.body = user.toJson();
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

// this is the user entery
var user = User(
  email: 'example@example.com',
  password: 'password',
  Fname: 'John Doe',
  DateOfBirth: '1990-01-01',
  phone_num: 123456789,
  location: 'New York',
  blood_group: 'O+',
);

//login function
void login() async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('http://127.0.0.1:8000/login/'));
  //here I send the password and the phone number for login by passing them to the body
  request.body = json.encode({"password": "123", "phone_num": "0123456789"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  //here is the response
  if (response.statusCode == 200) {
    String body = await response.stream.bytesToString();
    var responseJason = jsonDecode(body);
    //here I save the token to var you can save it to sharedprefrence
    var token = responseJason['token'];
    print(body);
    print("Token$token");
  } else {
    print(response.reasonPhrase);
  }
}
