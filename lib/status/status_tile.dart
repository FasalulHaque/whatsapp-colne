import 'package:flutter/material.dart';
import 'package:whatsapp_clone/status/status_pagemodels.dart';

class StatusTile extends StatelessWidget {
  StatusTile({super.key, required this.users});
  Staatus users;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(users.image!),
      ),
      title: Text(users.name!),
      subtitle: Text(users.updatesAt!),
    );
  }
}
