import 'package:blood_bank/view/shared/component/components.dart';
import 'package:flutter/material.dart';

import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';
import '../../../shared/component/helperfunctions.dart';
import '../../blood_bank/blood_bank_view.dart';

class ExamineBlood extends StatefulWidget {
  const ExamineBlood({
    super.key,
    required this.email,
    required this.location,
    required this.personName,
    required this.phoneNumber,
  });
  final String? location;
  final String? phoneNumber;
  final String? email;
  final String? personName;
  @override
  State<ExamineBlood> createState() => _ExamineBloodState();
}

class _ExamineBloodState extends State<ExamineBlood> {
  String bloodGroupType = '';
  final haimoglobinController = TextEditingController();
  final pressureController = TextEditingController();
  final pulseController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  List bloodGroup = ['AB+', 'AB-', 'A', 'AA', 'B', 'BB', 'O', 'OO'];
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
                    location: widget.location,
                    phoneNumber: widget.phoneNumber,
                    email: widget.email,
                    personName: widget.personName),
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
