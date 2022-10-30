import 'package:flutter/material.dart';
import 'package:whatsapp_clone/calls/callmodel/call_models.dart';
import 'package:whatsapp_clone/calls/calls%20page/call_Detalis.dart';

class CallTill extends StatelessWidget {
  CallTill({Key? key, required this.userCall}) : super(key: key);
  UserCall userCall;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CallDetalis(Userdetali: userCall ) ,)),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(userCall.image!),
      ),
      title: Text(userCall.name!),
      subtitle: Text(userCall.updatesAt!),
      trailing: const Icon(Icons.call),
    );
  }
}
