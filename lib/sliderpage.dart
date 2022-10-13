import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_slider/global.dart';

void main() {
  runApp(
    MaterialApp(
      home: slider_page(),
    ),
  );
}

class slider_page extends StatefulWidget {
  const slider_page({Key? key}) : super(key: key);

  @override
  State<slider_page> createState() => _slider_pageState();
}

class _slider_pageState extends State<slider_page> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sider"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: global.allimagelist
                  .map(
                    (e) => Image.network(
                      e,
                      width: 350,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                  height: 300,
                  initialPage: currentindex,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  onPageChanged: (val, _) {
                    setState(() {
                      currentindex = val;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
