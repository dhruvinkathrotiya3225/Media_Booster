import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio/global.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: audioplay(),
    ),
  );
}

class audioplay extends StatefulWidget {
  const audioplay({Key? key}) : super(key: key);

  @override
  State<audioplay> createState() => _audioplayState();
}

class _audioplayState extends State<audioplay> {
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  String totalDuration = "0:00:00";
  bool isStop = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetsAudioPlayer.open(
      Playlist(
        audios: [
          Audio(global.musicassetlist[global.number]["path"]),
        ],
      ),
      loopMode: LoopMode.playlist,
      showNotification: true,
      autoStart: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note, size: 200),
            Text(
              "${global.musicassetlist[global.number]["name"]}",
              style: TextStyle(color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await assetsAudioPlayer.previous(
                        keepLoopMode: isStop = true);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                ),
                IconButton(
                  onPressed: () async {
                    await assetsAudioPlayer.stop();
                    await assetsAudioPlayer.play();

                    setState(() {
                      totalDuration = assetsAudioPlayer
                          .current.value!.audio.duration
                          .toString()
                          .split(".")[0];
                    });
                  },
                  icon: Icon(Icons.play_arrow),
                ),
                IconButton(
                  onPressed: () async {
                    await assetsAudioPlayer.pause();
                  },
                  icon: Icon(Icons.pause),
                ),
                IconButton(
                  onPressed: () async {
                    await assetsAudioPlayer.stop();
                  },
                  icon: const Icon(Icons.stop),
                ),
                IconButton(
                  onPressed: () async {
                    await assetsAudioPlayer.playlistPlayAtIndex(2);
                  },
                  icon: const Icon(Icons.navigate_next),
                ),
              ],
            ),
            StreamBuilder(
              stream: assetsAudioPlayer.currentPosition,
              builder: (context, snapshot) {
                Duration? data = snapshot.data;
                return Column(
                  children: [
                    Text("${data.toString().split(".")[0]}/${totalDuration}"),
                    Slider(
                      onChanged: (val) {
                        assetsAudioPlayer.seek(Duration(seconds: val.toInt()));
                      },
                      activeColor: Colors.white,
                      inactiveColor: Colors.black,
                      min: 0,
                      max: (assetsAudioPlayer.current.hasValue)
                          ? assetsAudioPlayer
                              .current.value!.audio.duration.inSeconds
                              .toDouble()
                          : 0,
                      value: data!.inSeconds.toDouble(),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
