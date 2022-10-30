import 'package:flutter/material.dart';
// import 'package:whatsapp_clone/calls/Call_tile.dart';
import 'package:whatsapp_clone/calls/callmodel/call_models.dart';
import 'Call_tile.dart';

class CallScreen extends StatelessWidget {
  CallScreen({super.key});

  List<UserCall> callList = [
    UserCall(
      image:
          'https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg?w=2000',
      name: 'FASALUL HAQUE',
      updatesAt: '4.00PM',
    ),
    UserCall(
      image:
          'https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=2000',
      name: 'HAQUE',
      updatesAt: '11.00AM',
    ),
    UserCall(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJfa758-9Zet25uR43OnWUDxPh_5ivrKWg4g&usqp=CAU',
      name: 'ARJ',
      updatesAt: '4.00PM',
    ),
    UserCall(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUEhL4sRJDSqfac51T5radEfBOPZLwjmOu776Ec-0cqg&s',
      name: 'STAM',
      updatesAt: '5.00AM',
    ),
    UserCall(
      image:
          'https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg',
      name: 'STMTT',
      updatesAt: '6.00AM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: callList.length,
          itemBuilder: (BuildContext context, int index) {
            return CallTill(userCall: callList[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.call),
      ),
    );
  }
}
