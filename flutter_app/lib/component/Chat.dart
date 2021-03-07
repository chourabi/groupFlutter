import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Profile.dart';

class Chat extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;

  const Chat({Key key, this.title, this.subtitle, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // we are going to another page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage(fullname: "hello name",)),
        );
      },
      title: Text(title),
      subtitle: Text(subtitle),
      leading: CircleAvatar(
        child: Image.network(
            "https://image.flaticon.com/icons/png/512/147/147144.png"),
      ),
      trailing: Text(date),
    );
  }
}
