// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Chats/ChatTile.dart';
import 'package:whatsapp_clone/Chats/models/Chart_models.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  List<User> Users = [
    User(
        name: 'FASALUL HAQUE',
        message: 'HELLO',
        image:
            ('https://thumbs.dreamstime.com/b/happy-person-portrait-smiling-woman-tanned-skin-curly-hair-happy-person-portrait-smiling-young-friendly-woman-197501184.jpg'),
        isGroup: false,
        updatesAt: '4am'),
    User(
        name: 'HAQUE',
        image:
            ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqUe6-coLY2LyQTaBHjhg0OESsXPsvs8c2FQIlr1ZoHA&s'),
        message: 'Hi',
        isGroup: false,
        updatesAt: ' 5am'),
    User(
        name: 'FLUTTER',
        image: (''),
        message: 'H',
        isGroup: true,
        updatesAt: ' 90am'),
    User(
        name: 'DART',
        image: ('https://www.memezero.com/media/memes/ED402N.jpg'),
        message: 'Hii',
        isGroup: true,
        updatesAt: ' 2am'),
    User(
        name: 'MRJ',
        image:
            ('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fHBlcnNvbnxlbnwwfHwwfHw%3D&w=1000&q=80'),
        message: 'Hw',
        isGroup: false,
        updatesAt: ' 8am'),
    User(
        name: 'NEROJ',
        image: (''),
        message: 'Hw',
        isGroup: false,
        updatesAt: ' 8am'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: Users.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatTile(
            UserData: Users[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.message,
        ),
      ),
    );
  }
}
