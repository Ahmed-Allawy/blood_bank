// ignore: must_be_immutable
// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:blood_bank/view/shared/component/components.dart';
import 'package:blood_bank/view/shared/component/helperfunctions.dart';
import 'package:flutter/material.dart';

import '../../../../model/bloodImages.dart';
import '../../../../model/userBloodRequests.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';
import '../../../shared/network/local/cach_helper.dart';
import 'package:http/http.dart' as http;

import '../../examine_blood/widgets/examine_blood_view_body.dart';

class BloodBankViewBody extends StatefulWidget {
  const BloodBankViewBody({
    Key? key,
    required this.exitButton,
  }) : super(key: key);
  final VoidCallback? exitButton;
  @override
  State<BloodBankViewBody> createState() => _BloodBankViewBodyState();
}

class _BloodBankViewBodyState extends State<BloodBankViewBody> {
  bool requestButton = true;
  bool donateButtonState = false;
  bool bankButtonState = false;
  List<BloodRequest> requestsList = [];
  List<DonateModel> donatesList = [];
  List<BloodRequest> bloodBankList = [];
  @override
  void initState() {
    getAllBloodRequest().then((value) {
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
            onPressed: widget.exitButton!,
          ),
          centerTitle: true,
          title: const Text(
            'Manage Bloods',
            style: TextStyle(
              fontSize: 36,
              color: secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 0.08 * LayoutSize.layoutValue!,
            ),
            ThreeButtons(
              leftButtonCaption: 'Requests',
              rightButtonCation: 'Bank',
              middleButtonCaption: 'Donates',
              requestButton: requestButton,
              btnThirdState: bankButtonState,
              donateButtonState: donateButtonState,
              ontapOne: () {
                setState(() {
                  requestButton = true;
                  donateButtonState = false;
                  bankButtonState = false;
                });
              },
              ontapTwo: () {
                getAllDonatedRequest().then((value) {
                  setState(() {
                    donatesList = value;
                  });
                });
                setState(() {
                  requestButton = false;
                  donateButtonState = true;
                  bankButtonState = false;
                });
              },
              ontapThree: () {
                getBloodBank().then((value) {
                  setState(() {
                    bloodBankList = value;
                  });
                });
                setState(() {
                  requestButton = false;
                  donateButtonState = false;
                  bankButtonState = true;
                });
              },
            ),
            //get all requests and show it at a card
            if (requestButton)
              Expanded(
                child: ListView.builder(
                  itemCount: requestsList.length,
                  padding: EdgeInsets.symmetric(
                      vertical: 0.15 * LayoutSize.layoutValue!),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(
                            bottom: 0.08 * LayoutSize.layoutValue!),
                        child: BloodBankCards(
                          dateText: requestsList[index].date,
                          personName: requestsList[index].fname,
                          time: requestsList[index].time,
                          personLocation: requestsList[index].location,
                          personImage:
                              BloodImages(requestsList[index].bloodGroup)
                                  .getBloodImages(),
                          buttonCaption:
                              requestsList[index].approved ? "Done" : "Accept",
                          onTapButton: () {
                            approvedRequests(requestsList[index].id);
                            getAllBloodRequest().then((value) {
                              setState(() {
                                requestsList = value;
                              });
                            });
                          },
                        ));
                  },
                ),
              ),
            if (donateButtonState)
              Expanded(
                child: ListView.builder(
                  itemCount: donatesList.length,
                  padding: EdgeInsets.symmetric(
                      vertical: 0.15 * LayoutSize.layoutValue!),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(
                            bottom: 0.08 * LayoutSize.layoutValue!),
                        child: BloodBankCards(
                          dateText: donatesList[index].date,
                          personName: donatesList[index].firstName,
                          time: donatesList[index].time,
                          personLocation: donatesList[index].location,
                          personImage:
                              BloodImages(donatesList[index].bloodGroup)
                                  .getBloodImages(),
                          buttonCaption: 'examine',
                          onTapButton: () {
                            nextScreen(
                                context,
                                ExamineBlood(
                                  email: donatesList[index].bloodGroup,
                                  location: donatesList[index].location,
                                  personName: donatesList[index].firstName,
                                  phoneNumber: donatesList[index].campaign,
                                  id: donatesList[index].id,
                                ));
                          },
                        ));
                  },
                ),
              ),
            if (bankButtonState)
              Expanded(
                child: ListView.builder(
                  itemCount: bloodBankList.length,
                  padding: EdgeInsets.symmetric(
                      vertical: 0.15 * LayoutSize.layoutValue!),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(
                            bottom: 0.08 * LayoutSize.layoutValue!),
                        child: BloodBankCards(
                          dateText: bloodBankList[index].date,
                          personName: bloodBankList[index].fname,
                          time: bloodBankList[index].time,
                          personLocation: bloodBankList[index].location,
                          personImage:
                              BloodImages(bloodBankList[index].bloodGroup)
                                  .getBloodImages(),
                          buttonCaption: 'Donated',
                          onTapButton: () {
                            deleteBank(bloodBankList[index].id);
                            getBloodBank().then((value) {
                              setState(() {
                                bloodBankList = value;
                              });
                            });
                          },
                        ));
                  },
                ),
              ),
          ],
        ));
  }
}

class ThreeButtons extends StatefulWidget {
  const ThreeButtons(
      {super.key,
      required this.leftButtonCaption,
      required this.rightButtonCation,
      required this.middleButtonCaption,
      required this.requestButton,
      required this.donateButtonState,
      required this.btnThirdState,
      required this.ontapOne,
      required this.ontapTwo,
      required this.ontapThree});
  final String? leftButtonCaption;
  final String? rightButtonCation;
  final String? middleButtonCaption;
  final bool requestButton;
  final bool donateButtonState;
  final bool btnThirdState;
  final VoidCallback? ontapOne;
  final VoidCallback? ontapTwo;
  final VoidCallback? ontapThree;
  @override
  State<ThreeButtons> createState() => _ThreeButtonsState();
}

class _ThreeButtonsState extends State<ThreeButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 0.08 * LayoutSize.layoutValue!,
        ),
        Flexible(
          flex: 1,
          child: SizedBox(
            height: 55,
            child: GeneralcustomButton(
              text: widget.leftButtonCaption,
              selected: widget.requestButton,
              onTap: widget.ontapOne,
            ),
          ),
        ),
        SizedBox(
          width: 0.04 * LayoutSize.layoutValue!,
        ),
        Flexible(
          flex: 1,
          child: SizedBox(
            height: 55,
            child: GeneralcustomButton(
              text: widget.middleButtonCaption,
              selected: widget.donateButtonState,
              onTap: widget.ontapTwo,
            ),
          ),
        ),
        SizedBox(
          width: 0.04 * LayoutSize.layoutValue!,
        ),
        Flexible(
          flex: 1,
          child: SizedBox(
            height: 55,
            child: GeneralcustomButton(
              text: widget.rightButtonCation,
              selected: widget.btnThirdState,
              onTap: widget.ontapThree,
            ),
          ),
        ),
        SizedBox(
          width: 0.08 * LayoutSize.layoutValue!,
        ),
      ],
    );
  }
}

Future<List<BloodRequest>> getAllBloodRequest() async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {'Authorization': 'Token $token'};
  var request = http.Request(
      'GET', Uri.parse('http://127.0.0.1:8000/blood/all/blood-requests/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var body = await response.stream.bytesToString();
    List<dynamic> jsonList = jsonDecode(body);
    List<BloodRequest> bloodRequests =
        jsonList.map((json) => BloodRequest.fromJson(json)).toList();

    return bloodRequests;
  } else {
    return []; // Return an empty list if the response status code is not 200
  }
}

void approvedRequests(int id) async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {
    'Authorization': 'Token $token',
    'Content-Type': 'application/json'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://127.0.0.1:8000/blood/$id/request-approved/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
  } else {}
}

Future<List<DonateModel>> getAllDonatedRequest() async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {'Authorization': 'Token $token'};
  var request = http.Request(
      'GET', Uri.parse('http://127.0.0.1:8000/blood/all/donate-requests/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var body = await response.stream.bytesToString();
    List<dynamic> jsonList = jsonDecode(body);

    List<DonateModel> donatemodel =
        jsonList.map((json) => DonateModel.fromJson(json)).toList();

    return donatemodel;
  } else {
    return []; // Return an empty list if the response status code is not 200
  }
}

Future<List<BloodRequest>> getBloodBank() async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {'Authorization': 'Token $token'};
  var request = http.Request(
      'GET', Uri.parse('http://127.0.0.1:8000/blood/all/accepted-requests/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var body = await response.stream.bytesToString();
    List<dynamic> jsonList = jsonDecode(body);

    List<BloodRequest> donatemodel =
        jsonList.map((json) => BloodRequest.fromJson(json)).toList();

    return donatemodel;
  } else {
    return []; // Return an empty list if the response status code is not 200
  }
}

void deleteBank(int id) async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {
    'Authorization': 'Token $token',
    'Content-Type': 'application/json'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://127.0.0.1:8000/blood/$id/donate-delete/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print('deleted');
  } else {}
}
