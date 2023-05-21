// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:blood_bank/view/shared/component/components.dart';
import 'package:blood_bank/view/shared/network/local/cach_helper.dart';
import 'package:flutter/material.dart';

import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';
import '../../../shared/component/helperfunctions.dart';
import '../../blood_bank/blood_bank_view.dart';
import 'package:http/http.dart' as http;

class ExamineBlood extends StatefulWidget {
  const ExamineBlood({
    super.key,
  });

  @override
  State<ExamineBlood> createState() => _ExamineBloodState();
}

class _ExamineBloodState extends State<ExamineBlood> {
  String bloodGroupType = '';
  final haimoglobinController = TextEditingController();
  final pressureController = TextEditingController();
  final pulseController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  List bloodGroup = ['AB+', 'AB-', 'A+', 'A-', 'B+', 'B-', 'O+', 'O-'];
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
              nextScreenRep(context, const BloodBankView());
            },
          ),
          centerTitle: true,
          title: const Text(
            'Examine Blood',
            style: TextStyle(
              fontSize: 36,
              color: secondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 0.08 * LayoutSize.layoutValue!,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: GeneralUserInfo(
                    location: CacheHelper.getData(key: 'userLocation'),
                    phoneNumber: CacheHelper.getData(key: 'userPhoneNumber'),
                    email: CacheHelper.getData(key: 'userEmail'),
                    personName: CacheHelper.getData(key: 'userName')),
              ),
              Form(
                //this is the key
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 70, right: 70, top: 20),
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
                                  bloodGroupType.isEmpty
                                      ? 'Select Blood Group'
                                      : 'your blood group is  $bloodGroupType',
                                  style: TextStyle(
                                      color: bloodGroupType.isEmpty
                                          ? popColor
                                          : Colors.black),
                                ),
                                items: bloodGroup.map((value) {
                                  return DropdownMenuItem(
                                      value: value, child: Text(value));
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    bloodGroupType = value.toString();
                                  });
                                }),
                          ]),
                        ),
                      ),
                      TextInputField(
                        textController: haimoglobinController,
                        keyboardType: TextInputType.number,
                        hintText: 'Haimoglobin',
                        icon: const Icon(Icons.person),
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalied Input';
                          }
                          return null;
                        },
                      ),
                      TextInputField(
                        textController: pressureController,
                        keyboardType: TextInputType.number,
                        hintText: 'Pressure',
                        icon: const Icon(Icons.person),
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalied Input';
                          }
                          return null;
                        },
                      ),
                      TextInputField(
                        textController: pulseController,
                        keyboardType: TextInputType.number,
                        hintText: 'Pulse',
                        icon: const Icon(Icons.person),
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalied Input';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 0.1 * LayoutSize.layoutValue!,
                      ),
                      SizedBox(
                        width: 210,
                        height: 50,
                        child: GeneralcustomButton(
                          text: "Done",
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                            }
                          },
                          selected: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

sendExaminedRequests(BuildContext context, String bloodType) async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {
    'Authorization': 'Token $token',
    'Content-Type': 'application/json'
  };
  var request = http.Request(
      'POST', Uri.parse('http://127.0.0.1:8000/blood/donate-other/'));
  request.body = json.encode({
    "blood_group": bloodType,
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 201) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          title: const Text('Accepted'),
          content: const Text('Your request has been created !'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: const Text('Declined'),
          content: const Text('Your request has been refuesd !'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
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
