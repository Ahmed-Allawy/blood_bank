// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../model/userBloodRequests.dart';
import '../../shared/network/local/cach_helper.dart';
import 'widgets/requests_sideBar_view_body.dart';
import 'package:http/http.dart' as http;

class RequestsSideBarView extends StatefulWidget {
  const RequestsSideBarView({super.key});

  @override
  State<RequestsSideBarView> createState() => _RequestsSideBarViewState();
}

class _RequestsSideBarViewState extends State<RequestsSideBarView> {
  @override
  Widget build(BuildContext context) {
    return const RequestsSideBarBody();
  }
}

//// get my requests
///{
///date, time, hospital location, name(self or other), blood group, status(accepted or pending)

///} i can remove pending requests
//this for removeing the request
// var headers = {
//   'Authorization': 'Token 08fda60e13a1e8adff11b07089d40db8fa7e03ec'
// };
// var request = http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:8000/blood/6/request-delete/'));

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

//this to remove the donate requet
// var headers = {
//   'Authorization': 'Token 08fda60e13a1e8adff11b07089d40db8fa7e03ec'
// };
// var request = http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:8000/blood/5/donate-delete/'));

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
