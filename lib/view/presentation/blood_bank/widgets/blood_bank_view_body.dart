// ignore: must_be_immutable
// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:blood_bank/view/presentation/examine_blood/examine_blood_view.dart';
import 'package:blood_bank/view/shared/component/components.dart';
import 'package:blood_bank/view/shared/component/helperfunctions.dart';
import 'package:flutter/material.dart';

import '../../../../model/bloodImages.dart';
import '../../../../model/userBloodRequests.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';
import '../../../shared/network/local/cach_helper.dart';
import '../../home_screen/home_body.dart';
import 'package:http/http.dart' as http;

class BloodBankViewBody extends StatefulWidget {
  const BloodBankViewBody({
    Key? key,
    required this.requestAccept,
    required this.dateTextR,
    required this.personNameR,
    required this.timeR,
    required this.personLocationR,
    required this.personImageR,
    required this.dateTextD,
    required this.personNameD,
    required this.timeD,
    required this.personLocationD,
    required this.personImageD,
    required this.dateTextB,
    required this.personNameB,
    required this.timeB,
    required this.personLocationB,
    required this.personImageB,
  }) : super(key: key);

  final bool? requestAccept;
  final String? dateTextR;
  final String? personNameR;
  final String? timeR;
  final String? personLocationR;
  final String? personImageR;
  final String? dateTextD;
  final String? personNameD;
  final String? timeD;
  final String? personLocationD;
  final String? personImageD;
  final String? dateTextB;
  final String? personNameB;
  final String? timeB;
  final String? personLocationB;
  final String? personImageB;
  @override
  State<BloodBankViewBody> createState() => _BloodBankViewBodyState();
}

class _BloodBankViewBodyState extends State<BloodBankViewBody> {
  bool requestButton = true;
  bool donateButtonState = false;
  bool bankButtonState = false;
//  requestBloodBank = {"id":9,"user":"0123456789","Fname":"Ahmed Alawy","location":"Zagazig","approved":false,"blood_group":null,"date":"2023-05-11","time":"08:19:13.641287"};
  List<BloodRequest> requestsList = [];
  List<DonateModel> donatesList = [];
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
            onPressed: () {
              nextScreenRep(context, const Home());
            },
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
                setState(() {
                  requestButton = false;
                  donateButtonState = false;
                  bankButtonState = true;
                });
              },
            ),
            if (requestButton)
              Expanded(
                child: ListView.builder(
                  itemCount: 7,
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
                            getAllBloodRequest().then((value) {
                              setState(() {
                                requestsList = value;
                              });
                            });
                            approvedRequests(requestsList[index].id);
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
                            nextScreen(context, const ExamineBloodView());
                          },
                        ));
                  },
                ),
              ),
            if (bankButtonState)
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
                          dateText: widget.dateTextB,
                          personName: widget.personNameB,
                          time: widget.timeD,
                          personLocation: widget.personLocationB,
                          personImage: widget.personImageB,
                          buttonCaption: 'Donated',
                          onTapButton: () {},
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

///// requests API(get all)
///{
///date, time, name, location, blood group, status(accepted or pendding)
///} i can change status
///****************************************/
///Donates API(get all)
///{
///date, time, name, location, blood group
///}
//////****************************************/
///Bank API(get all)
///{
///date, time, name, location, blood group
///} i can remove any item
///
///

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
    print(response.reasonPhrase);
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
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
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
    print(donatemodel[0].firstName);
    return donatemodel;
  } else {
    print(response.reasonPhrase);
    return []; // Return an empty list if the response status code is not 200
  }
}
