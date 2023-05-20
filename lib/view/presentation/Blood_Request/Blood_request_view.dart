// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, avoid_print

import 'package:blood_bank/view/presentation/Blood_Request/widgets/blood_request_view_body.dart';
import 'package:blood_bank/view/shared/network/local/cach_helper.dart';

import 'package:flutter/material.dart';
import '../../../model/bloodImages.dart';

import 'package:http/http.dart' as http;

class BloodRequestView extends StatefulWidget {
  const BloodRequestView({super.key});

  @override
  State<BloodRequestView> createState() => _BloodrequestViewState();
}

class _BloodrequestViewState extends State<BloodRequestView> {
  @override
  Widget build(BuildContext context) {
    return BloodRequestViewBody(
      email: CacheHelper.getData(key: 'userEmail'),
      location: CacheHelper.getData(key: 'userLocation'),
      doneOntap: () {
        setState(() {
          sendUserBloodRequest().then((value) {
            if (value) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.green,
                    title: Text('Accepted'),
                    content: Text('Your request has been created '),
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
          });

          //sendBloodRequest();
        });
      },
      phoneNumber: (CacheHelper.getData(key: 'userPhoneNumber')).toString(),
      imageBlood: BloodImages(CacheHelper.getData(key: 'userBloodType'))
          .getBloodImages(),
      personName: CacheHelper.getData(key: 'userName'),
    );
  }
}

/// Self API (get)
/// {
/// bloog group,
/// name,
/// location,
/// phone number,
/// email
/// } i can make request blood with these info
/// to get those enfo
//  var headers = {
// };
// var request = http.Request('GET', Uri.parse('http://127.0.0.1:8000/getuser'));

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

Future<bool> sendUserBloodRequest() async {
  var token = CacheHelper.getData(key: 'token');
  print(token);
  var headers = {'Authorization': 'Token $token'};
  var request = http.Request(
      'POST', Uri.parse('http://127.0.0.1:8000/blood/request-self/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 201) {
    var body = await response.stream.bytesToString();

    print(body);
    return true;
  } else {
    print("response.reasonPhrase");
    return false;
  }
}

void getUserBloodRequest() async {
  var token = CacheHelper.getData(key: 'token');
  print(token);
  var headers = {'Authorization': 'Token $token'};
  var request = http.Request(
      'GET', Uri.parse('http://127.0.0.1:8000/blood/user/blood-requests/'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var body = await response.stream.bytesToString();
    print(body);
  } else {
    print(response.reasonPhrase);
  }
}
