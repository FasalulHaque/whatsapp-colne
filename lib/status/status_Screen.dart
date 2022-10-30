import 'package:flutter/material.dart';

import 'package:whatsapp_clone/status/status_pagemodels.dart';
import 'package:whatsapp_clone/status/status_tile.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  List<Staatus> datas = [
    Staatus(
      name: 'FASALUL HAQUE',
      image: '',
      updatesAt: '10am',
    ),
    Staatus(
      name: 'FASALUL ',
      image:
          ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUEhL4sRJDSqfac51T5radEfBOPZLwjmOu776Ec-0cqg&s'),
      updatesAt: '9am',
    ),
    Staatus(
        name: ' HAQUE',
        image:
            ('https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=2000'),
        updatesAt: '5am'),
    Staatus(
        name: 'FLUTTER',
        image:
            ('https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg?w=2000'),
        updatesAt: '8am'),
    Staatus(
        name: 'ARUN',
        image:
            ('https://thumbs.dreamstime.com/b/nice-to-talk-smart-person-indoor-shot-attractive-interesting-caucasian-guy-smiling-broadly-nice-to-112345489.jpg'),
        updatesAt: '4am'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (BuildContext context, int index) {
          return StatusTile(
            users: datas[index],
          );
        },
      ),
    );
  }
}
