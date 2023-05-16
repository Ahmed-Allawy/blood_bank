// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../shared/component/components.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';
import '../../../shared/component/helperfunctions.dart';
import '../../home_screen/home_body.dart';

class BloodRequestViewBody extends StatefulWidget {
  const BloodRequestViewBody({
    Key? key,
    required this.doneOntap,
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
  final VoidCallback? doneOntap;
  final String? imageBlood;
  final String? personName;
  @override
  State<BloodRequestViewBody> createState() => _BloodRequestViewBodyState();
}

class _BloodRequestViewBodyState extends State<BloodRequestViewBody> {
  bool _pageNumber = true;
  /////// other anfo
  String otherBloodGroupType = '';
  final otherNameController = TextEditingController();
  final otherDateController = TextEditingController();
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
            nextScreenRep(context, const Home());
          },
        ),
        centerTitle: true,
        title: const Text(
          'Blood Request',
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
                print('pageNumber is false');
              });
            },
            leftButtonCaption: 'Self',
            rightButtonCation: 'Other',
            leftButtonOntap: () {
              setState(() {
                _pageNumber = true;
                print('pageNumber is true');
              });
            },
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
                    buttonCaption: 'Request blood',
                    ontap: widget.doneOntap,
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
                        DateInputField(
                          controller: otherDateController,
                          labelText: 'Date Of Birth',
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
                                      print(otherBloodGroupType);
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
                            text: "Request blood",
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                print(otherDateController.text);
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
