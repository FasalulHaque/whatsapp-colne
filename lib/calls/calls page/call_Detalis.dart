import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/calls/callmodel/call_models.dart';

class CallDetalis extends StatelessWidget {
  CallDetalis({super.key, required this.Userdetali});
  UserCall Userdetali;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Call Info'),
        actions: [
          const Icon(Icons.message),
          PopupMenuButton(itemBuilder: (context) {
            return const [
              PopupMenuItem(child: Text('Remove from call log')),
              PopupMenuItem(child: Text('Block'))
            ];
          })
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(Userdetali.image!),
            ),
            title: Text(Userdetali.name!),
            subtitle: const Text('Busy'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.missed_video_call),
                Icon(Icons.call),
              ],
            ),
          );
        },
      ),
    );
  }
}
