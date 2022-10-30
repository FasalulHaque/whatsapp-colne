import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Chats/Pages/ChatDetalis.dart/ChatDetalis.dart';
import 'package:whatsapp_clone/Chats/models/Chart_models.dart';

class ChatTile extends StatelessWidget {
  ChatTile({Key? key, required this.UserData}) : super(key: key);

  User UserData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatDetali(UserDetalis: UserData),
        ),
      ),
      leading: CircleAvatar(
          backgroundImage: (UserData.image == '')
              ? AssetImage(UserData.isGroup!
                  ? 'assets/images/group_icon.png'
                  : 'assets/images/perdson_icon.jpg') as ImageProvider<Object>?
              : NetworkImage(UserData.image!)),
      title: Text(UserData.name!),
      subtitle: Text(UserData.message!),
      trailing: Text(UserData.updatesAt!),
    );
  }
}
