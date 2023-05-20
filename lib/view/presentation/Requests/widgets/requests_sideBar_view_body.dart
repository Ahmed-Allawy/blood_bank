// ignore: must_be_immutable
// ignore_for_file: file_names

import 'dart:convert';

import 'package:blood_bank/model/bloodImages.dart';
import 'package:flutter/material.dart';

import '../../../../model/userBloodRequests.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';
import '../../../shared/component/helperfunctions.dart';
import '../../../shared/network/local/cach_helper.dart';
import '../../home_screen/home_body.dart';
import 'requests_cards.dart';
import 'package:http/http.dart' as http;

class RequestsSideBarBody extends StatefulWidget {
  const RequestsSideBarBody({Key? key}) : super(key: key);

  @override
  State<RequestsSideBarBody> createState() => _RequestsSideBarBodyState();
}

class _RequestsSideBarBodyState extends State<RequestsSideBarBody> {
  List<BloodRequest> requestsList = [];
  @override
  void initState() {
    getUserBloodRequest().then((value) {
      setState(() {
        requestsList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LayoutSize().init(context);

    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          toolbarHeight: 0.16 * LayoutSize.layoutValue!,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: anotherColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(33),
                bottomRight: Radius.circular(33),
              ),
            ),
          ),
          leading: BackButton(
            color: secondaryColor,
            onPressed: () async {
              nextScreenRep(context, const Home());
            },
          ),
          centerTitle: true,
          title: const Text(
            'MY Requests',
            style: TextStyle(
              fontSize: 36,
              color: secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: requestsList.length,
          padding:
              EdgeInsets.symmetric(vertical: 0.15 * LayoutSize.layoutValue!),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding:
                    EdgeInsets.only(bottom: 0.08 * LayoutSize.layoutValue!),
                child: RequestCards(
                    dateText: requestsList[index].date,
                    personName: requestsList[index].fname,
                    time: requestsList[index].time,
                    personLocation: requestsList[index].location,
                    status: requestsList[index].approved,
                    personImage: BloodImages(requestsList[index].bloodGroup)
                        .getBloodImages(),
                    onTap: () {
                      if (!requestsList[index].approved) {
                        deleteRequests(requestsList[index].id);
                      }
                      getUserBloodRequest().then((value) {
                        setState(() {
                          requestsList = value;
                        });
                      });
                    }));
          },
        ));
  }
}

Future<List<BloodRequest>> getUserBloodRequest() async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {'Authorization': 'Token $token'};
  var request = http.Request(
      'GET', Uri.parse('http://127.0.0.1:8000/blood/user/blood-requests/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var body = await response.stream.bytesToString();
    List<dynamic> jsonList = jsonDecode(body);
    List<BloodRequest> bloodRequests =
        jsonList.map((json) => BloodRequest.fromJson(json)).toList();

    return bloodRequests;
  } else {
    print(response.reasonPhrase);
    return []; // Return an empty list if the response status code is not 200
  }
}

void deleteRequests(int id) async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {
    'Authorization': 'Token $token',
    'Content-Type': 'application/json'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://127.0.0.1:8000/blood/$id/request-delete/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
