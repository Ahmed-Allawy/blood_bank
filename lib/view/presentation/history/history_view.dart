import 'package:blood_bank/view/presentation/home_screen/home_body.dart';
import 'package:blood_bank/view/shared/component/helperfunctions.dart';
import 'package:flutter/material.dart';

import 'widgets/history_view_body.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return const HistoryViewBody(
      dateTextD: '24/12/2023',
      donarID: '45',
      timeD: '3 : 00 Am',
      personLocationD: '123,xyz,apt',
      dateTextR: '24/12/2023',
      receiverID: '13',
      timeR: '3 : 00 Am',
      personLocationR: '123,xyz,apt',
      donarEmail: 'ahmed@gmail.com',
      donarName: "Ahmed Allawy Zena",
      donarPhoneNumber: '0102332433',
      bloodType: 'assets/B.png',
    );
  }
}

/// get donate history of this user
/// ==>> user donated
/// {
/// date, time, location, receiver id
/// }
/// ***************************************/
/// ==>> user reveived
/// {
/// date, time, location, donor id
/// donar -> name, location, phone number, email
/// }
/// this is the get request
// var headers = {
//   'Authorization': 'Token a5fd5ff9e485f4938c0bd3606c1d5060c7e63821'
// };
// var request = http.Request('GET', Uri.parse('http://127.0.0.1:8000/blood/user/donate-requests/'));

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
