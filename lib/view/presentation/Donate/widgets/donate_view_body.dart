// ignore_for_file: must_be_immutable

import 'package:blood_bank/view/presentation/Blood_Request/Blood_request_view.dart';
import 'package:flutter/material.dart';

import '../../../shared/component/components.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';
import '../../../shared/component/helperfunctions.dart';
import '../../../shared/network/local/cach_helper.dart';
import '../../home_screen/home_body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DonateViewBody extends StatefulWidget {
  const DonateViewBody({
    Key? key,
    required this.location,
    required this.phoneNumber,
    required this.email,
    required this.imageBlood,
    required this.personName,
  }) : super(key: key);
  //// user info
  final String? location;
  final String? phoneNumber;
  final String? email;

  final String? imageBlood;
  final String? personName;
  @override
  State<DonateViewBody> createState() => _DonateViewBodyState();
}

class _DonateViewBodyState extends State<DonateViewBody> {
  bool _pageNumber = true;
  /////// other anfo
  String otherBloodGroupType = '';
  String CampagainName = '';
  final otherNameController = TextEditingController();
  final otherDateController = TextEditingController();
  final otherLocationController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  List bloodGroup = ['AB+', 'AB-', 'A+', 'A-', 'B+', 'B-', 'O+', 'O-'];
  List campagain = [
    'gegergreg',
    'dggfegf-',
    'A+',
    'fgd-',
    'B+',
    'B-',
    'O+',
    'O-'
  ];
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
          'Donate',
          style: TextStyle(
            fontSize: 36,
            color: secondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 0.08 * LayoutSize.layoutValue!,
          ),
          GeneralOptionButtons(
            selected: _pageNumber,
            rightButtonOntap: () {
              setState(() {
                _pageNumber = false;
              });
            },
            leftButtonCaption: 'Self',
            rightButtonCation: 'Other',
            leftButtonOntap: () {
              setState(() {
                _pageNumber = true;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 70, top: 60),
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: anotherColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: <Widget>[
                const Icon(
                  Icons.location_on,
                  color: secondaryColor,
                ),
                DropdownButton(
                    iconEnabledColor: secondaryColor,
                    hint: Text(
                      CampagainName.isEmpty
                          ? 'Select campagain'
                          : ' $CampagainName',
                      style: TextStyle(
                          color: campagain.isEmpty ? popColor : Colors.black),
                    ),
                    items: campagain.map((value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        CampagainName = value.toString();
                      });
                    }),
              ]),
            ),
          ),
          if (_pageNumber)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.1 * LayoutSize.layoutValue!,
                    vertical: 0.2 * LayoutSize.layoutValue!,
                  ),
                  child: GeneralUserInfo(
                    location: widget.location!,
                    phoneNumber: widget.phoneNumber!,
                    email: widget.email!,
                    buttonCaption: 'NEXT',
                    ontap: () {
                      sendUserDonateRequest(
                          widget.personName!,
                          widget.location!,
                          context,
                          widget.imageBlood!,
                          CampagainName);
                      CampagainName = '';
                    },
                    imageBlood: widget.imageBlood,
                    personName: widget.personName,
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  //this is the key
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(
                      children: <Widget>[
                        TextInputField(
                          textController: otherNameController,
                          obscureText: false,
                          hintText: 'Full Name',
                          icon: const Icon(Icons.person),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Invalied Input';
                            }
                            return null;
                          },
                        ),
                        TextInputField(
                          textController: otherLocationController,
                          obscureText: false,
                          hintText: 'location EX: zagazig-sharkia-egypt',
                          icon: const Icon(Icons.location_on),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Invalied Input';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 70, right: 70, top: 20),
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: anotherColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(children: <Widget>[
                              const Icon(
                                Icons.bloodtype,
                                color: secondaryColor,
                              ),
                              DropdownButton(
                                  iconEnabledColor: secondaryColor,
                                  hint: Text(
                                    otherBloodGroupType.isEmpty
                                        ? 'Select Blood Group'
                                        : 'your blood group is  $otherBloodGroupType',
                                    style: TextStyle(
                                        color: otherBloodGroupType.isEmpty
                                            ? popColor
                                            : Colors.black),
                                  ),
                                  items: bloodGroup.map((value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      otherBloodGroupType = value.toString();
                                    });
                                  }),
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: 0.1 * LayoutSize.layoutValue!,
                        ),
                        SizedBox(
                          width: 210,
                          height: 50,
                          child: GeneralcustomButton(
                            text: "Next",
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                sendOtherDonateRequest(
                                    otherNameController.text,
                                    otherLocationController.text,
                                    context,
                                    otherBloodGroupType,
                                    CampagainName);
                                otherBloodGroupType = '';
                                otherDateController.clear();
                                otherLocationController.clear();
                                CampagainName = '';
                                otherNameController.clear();
                              }
                            },
                            selected: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// other API (post)
/// {
/// bloog group,
/// name,
/// date of birth
/// } at the same user(self) info
sendUserDonateRequest(String Fname, String location, BuildContext context,
    String bloodType, String campagain) async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {
    'Authorization': 'Token $token',
    'Content-Type': 'application/json'
  };
  var request = http.Request(
      'POST', Uri.parse('http://127.0.0.1:8000/blood/donate-self/'));
  request.body = json.encode({
    'Fname': Fname,
    'location': location,
    "blood_group": bloodType,
    'campagain': campagain
  });
  print(request.body);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 201) {
    //print(await response.stream.bytesToString());
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          title: Text('Accepted'),
          content: Text('Your request has been created !'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } else {
    print(response.reasonPhrase);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Text('Declined'),
          content: Text('Your request has been refuesd !'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

sendOtherDonateRequest(String Fname, String location, BuildContext context,
    String bloodType, String campagain) async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {
    'Authorization': 'Token $token',
    'Content-Type': 'application/json'
  };
  var request = http.Request(
      'POST', Uri.parse('http://127.0.0.1:8000/blood/donate-other/'));
  request.body = json.encode({
    'Fname': Fname,
    'location': location,
    "blood_group": bloodType,
    'campagain': campagain
  });
  print(request.body);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 201) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          title: Text('Accepted'),
          content: Text('Your request has been created !'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } else {
    print(response.reasonPhrase);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Text('Declined'),
          content: Text('Your request has been refuesd !'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
