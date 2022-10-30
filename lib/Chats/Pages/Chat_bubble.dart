// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Chats/models/single_chat_model.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.singleChat});

  SingleChat singleChat;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          singleChat.isSend! ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.width - 150),
        child: Card(
          color: singleChat.isSend! ? const Color(0xffdcf6c6) : Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 7, right: 59, bottom: 10),
                child: Text(singleChat.message.toString()),
              ),
              Positioned(
                bottom: 3,
                right: 2,
                child: Row(
                  children: [
                    Text(
                      singleChat.sendAt!,
                      style: const TextStyle(fontSize: 10),
                    ),
                    if (singleChat.isSend!)
                      Icon(
                        Icons.done_all,
                        color: singleChat.isReaded! ? Colors.blue : Colors.grey,
                        size: 10,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
