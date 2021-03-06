import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.network(
                  "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png",
                );
  }


}