import 'package:flutter/material.dart';
import 'package:video_app/catagoery_page.dart';
import 'package:video_app/videoplaypage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => catagoery(),
      'video': (context) => video_player(
            video: [],
          ),
    },
  ));
}
