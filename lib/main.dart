import 'package:audio/global.dart';
import 'package:audio/play_audio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => asset_audio_pleyer(),
        "play_audio": (context) => audioplay(),
      },
    ),
  );
}

class asset_audio_pleyer extends StatefulWidget {
  const asset_audio_pleyer({Key? key}) : super(key: key);

  @override
  State<asset_audio_pleyer> createState() => _asset_audio_pleyerState();
}

class _asset_audio_pleyerState extends State<asset_audio_pleyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Audio"),
          backgroundColor: Colors.black26,
          centerTitle: true,
        ),
        backgroundColor: Colors.black.withOpacity(0.2),
        body: ListView.builder(
            itemCount: global.musicassetlist.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: InkWell(
                  onTap: () async {
                    print(i);
                    setState(() {
                      global.number = i;
                    });
                    Navigator.of(context).pushNamed("play_audio");
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      ListTile(
                        leading: Icon(
                          Icons.music_note,
                          color: Colors.white,
                        ),
                        title: Text(
                          "${global.musicassetlist[i]["name"]}",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
