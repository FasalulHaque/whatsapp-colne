import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Chats/Pages/Chat_bubble.dart';
import 'package:whatsapp_clone/Chats/models/Chart_models.dart';
import 'package:whatsapp_clone/Chats/models/single_chat_model.dart';

// ignore: must_be_immutable
class ChatDetali extends StatefulWidget {
  // ignore: non_constant_identifier_names
  ChatDetali({super.key, required this.UserDetalis});
  // ignore: non_constant_identifier_names
  User UserDetalis;

  @override
  State<ChatDetali> createState() => _ChatDetaliState();
}

class _ChatDetaliState extends State<ChatDetali> {
  final _messageController = TextEditingController();
  FocusNode focusNode = FocusNode();

  // ignore: non_constant_identifier_names
  bool Showsent = false;
  bool showemoji = false;

  List<SingleChat> bubble = [
    SingleChat(isReaded: true, isSend: true, message: 'hi', sendAt: '4:00 Pm'),
    SingleChat(
        isReaded: false, isSend: false, message: 'hello', sendAt: '6:00 am'),
    SingleChat(isReaded: true, isSend: true, message: 'ARE', sendAt: '2:00 am'),
    SingleChat(
        isReaded: false, isSend: false, message: 'y@ou', sendAt: '8:00 am'),
    SingleChat(isReaded: true, isSend: true, message: 'huu', sendAt: '9:00 am'),
    SingleChat(
        isReaded: false, isSend: false, message: 'hlw', sendAt: '10:00 pm'),
  ];
  var datetime = DateTime.now();

  void setbubble() {
    var time = '${datetime.hour}:${datetime.minute}am ';

    setState(() {
      bubble.add((SingleChat(
          isSend: true,
          isReaded: true,
          message: _messageController.text,
          sendAt: time)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        leading: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
            CircleAvatar(
                backgroundImage: widget.UserDetalis.image == ''
                    ? AssetImage(widget.UserDetalis.isGroup!
                            ? 'assets/images/group_icon.png'
                            : 'assets/images/perdson_icon.jpg')
                        as ImageProvider<Object>?
                    : NetworkImage(widget.UserDetalis.image!)),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.UserDetalis.name.toString()),
            const Text('Last seen today 11.50am'),
          ],
        ),
        actions: [
          const Icon(Icons.call),
          const Icon(Icons.video_call),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text(widget.UserDetalis.isGroup == true
                    ? 'Group info'
                    : 'View contact'),
              ),
              PopupMenuItem(
                  child: Text(widget.UserDetalis.isGroup == true
                      ? 'Group Media'
                      : 'Media,links,and docs')),
              const PopupMenuItem(child: Text('Search')),
              const PopupMenuItem(child: Text('Mute notifications')),
              const PopupMenuItem(child: Text('Wallpaper')),
              const PopupMenuItem(child: Text('More')),
            ];
          }),
        ],
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/WhatsApp.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            ListView.builder(
              itemCount: bubble.length,
              itemBuilder: (BuildContext context, int index) {
                return ChatBubble(
                  singleChat: bubble[index],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            focusNode: focusNode,
                            onTap: () {
                              setState(() {
                                showemoji = false;
                              });
                            },
                            controller: _messageController,
                            onChanged: ((value) {
                              // ignore: prefer_is_empty
                              if (value.length > 0) {
                                setState(() {
                                  Showsent = true;
                                });
                              } else {
                                setState(() {
                                  Showsent = false;
                                });
                              }

                              // ignore: avoid_print
                              print(value);
                            }),
                            decoration: InputDecoration(
                              hintText: 'Massage',
                              prefixIcon: IconButton(
                                icon: Icon(showemoji
                                    ? Icons.keyboard
                                    : Icons.emoji_emotions_outlined),
                                onPressed: () {
                                  setState(() {
                                    showemoji = !showemoji;
                                    showemoji
                                        ? FocusManager.instance.primaryFocus
                                            ?.unfocus()
                                        : focusNode.requestFocus();
                                  });
                                },
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) => menu(),
                                      );
                                    },
                                    icon: const Icon(Icons.attach_file),
                                  ),
                                  const Icon(Icons.currency_rupee),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(Icons.camera_alt),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setbubble();
                          _messageController.clear();
                        },
                        child: Icon(Showsent ? Icons.send : Icons.mic),
                      ),
                    ],
                  ),
                  Offstage(
                    offstage: !showemoji,
                    child: SizedBox(
                      height: 250,
                      child: EmojiPicker(
                        textEditingController: _messageController,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container menu() {
    return Container(
      height: 400,
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconWidget(
                    icon: const Icon(Icons.insert_drive_file),
                    color: Colors.purple,
                    text: 'Document'),
                IconWidget(
                    icon: const Icon(Icons.camera_alt),
                    color: Colors.pink,
                    text: 'Camera'),
                IconWidget(
                    icon: const Icon(Icons.insert_photo),
                    color: Colors.black,
                    text: 'Gallery'),

                // ignore: prefer_const_literals_to_create_immutables
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconWidget(
                    icon: const Icon(Icons.headset),
                    color: Colors.orange,
                    text: 'Audio'),
                IconWidget(
                    icon: const Icon(Icons.location_pin),
                    color: Colors.green,
                    text: 'Location'),
                IconWidget(
                    icon: const Icon(Icons.contact_page),
                    color: Colors.blue,
                    text: 'Contact'),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconWidget(
                      icon: const Icon(Icons.currency_rupee),
                      color: Colors.greenAccent,
                      text: 'Payment'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Column IconWidget({
    String? text,
    Icon? icon,
    Color? color,
  }) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        CircleAvatar(
          backgroundColor: color,
          // ignore: sort_child_properties_last
          child: icon,
          radius: 30,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(text!),
      ],
    );
  }
}

// // ignore: non_constant_identifier_names
// Widget SelectEmoji() {
//   return EmojiPicker(
//     onEmojiSelected: (emoji, category) {},
//   );
// }
