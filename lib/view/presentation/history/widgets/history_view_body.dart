// ignore: must_be_immutable
import 'dart:convert';

import 'package:blood_bank/model/bloodImages.dart';
import 'package:blood_bank/view/presentation/history/widgets/history_cards.dart';
import 'package:blood_bank/view/shared/network/local/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../model/userBloodRequests.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/device_size.dart';
import '../../../shared/component/helperfunctions.dart';
import '../../home_screen/home_body.dart';

class HistoryViewBody extends StatefulWidget {
  const HistoryViewBody({
    Key? key,
    required this.dateTextR,
    required this.timeR,
    required this.personLocationR,
    required this.receiverID,
  }) : super(key: key);

  /// doner info

  //// receiver info
  final String? dateTextR;
  final String? receiverID;
  final String? timeR;
  final String? personLocationR;
  @override
  State<HistoryViewBody> createState() => _HistoryViewBodyState();
}

class _HistoryViewBodyState extends State<HistoryViewBody> {
  List<BloodRequest> requestsList = [];
  @override
  void initState() {
    getUserDonateRequest().then((value) {
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
          'Donate History',
          style: TextStyle(
            fontSize: 36,
            color: secondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: requestsList.length,
        padding: EdgeInsets.symmetric(vertical: 0.15 * LayoutSize.layoutValue!),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.only(bottom: 0.08 * LayoutSize.layoutValue!),
              child: HistoryDonatesCards(
                  dateText: requestsList[index].date,
                  personName: requestsList[index].fname,
                  time: requestsList[index].time,
                  personLocation: requestsList[index].location,
                  personImage: BloodImages(requestsList[index].bloodGroup)
                      .getBloodImages()));
        },
      ),
    );
  }
}

Future<List<BloodRequest>> getUserDonateRequest() async {
  var token = CacheHelper.getData(key: 'token');
  var headers = {'Authorization': 'Token $token'};
  var request = http.Request(
      'GET', Uri.parse('http://127.0.0.1:8000/blood/user/donate-requests/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var body = await response.stream.bytesToString();
    List<dynamic> jsonList = jsonDecode(body);
    List<BloodRequest> bloodRequests =
        jsonList.map((json) => BloodRequest.fromJson(json)).toList();
    print(bloodRequests[0].location);
    return bloodRequests;
  } else {
    return []; // Return an empty list if the response status code is not 200
  }
}
