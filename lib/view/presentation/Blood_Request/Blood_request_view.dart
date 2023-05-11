// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:blood_bank/view/shared/component/components.dart';
import 'package:flutter/material.dart';
import '../../../model/model.dart';
import '../../shared/component/helperfunctions.dart';
import '../home_screen/home_body.dart';
import 'package:http/http.dart' as http;

class BloodRequestView extends StatefulWidget {
  const BloodRequestView({super.key});

  @override
  State<BloodRequestView> createState() => _BloodrequestViewState();
}

class _BloodrequestViewState extends State<BloodRequestView> {
  @override
  Widget build(BuildContext context) {
    return GeneralPage1(
      backOntap: () {
        nextScreenRep(context, const Home());
      },
      buttonCaption: 'Rquest blood',
      email: 'dgdssd@sdgd.com',
      location: 'cdscdsdsc',
      doneOntap: () {
        setState(() {
          print("object");
          // sendBloodRequest();
          // signup(user);
          login();
        });
      },
      pageTitle: 'Blood Blood',
      phoneNumber: '0101021342',
      leftButtonCaption: 'Self',
      rightButtonCation: 'Other',
      imageBlood: 'assets/O.png',
      personName: 'Ahmed allawy',
    );
  }
}

void sendBloodRequest() async {
  var headers = {
    'Authorization': 'Token a5fd5ff9e485f4938c0bd3606c1d5060c7e63821'
  };
  var request = http.Request(
      'POST', Uri.parse('http://127.0.0.1:8000/blood/request-self/'));

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
  request.body = json.encode({"password": "123", "phone_num": "01154363771"});
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
