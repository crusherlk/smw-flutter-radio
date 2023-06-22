import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool isPlaying = false;
  bool isDisabled = false;
  late AudioPlayer audioPlayer;

  Future<void> playAudioFromUrl(String url) async {
    isDisabled = true;
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: SpinKitWave(color: Colors.white),
          );
        });

    audioPlayer = AudioPlayer();
    await audioPlayer.play(UrlSource(url));

    if (context.mounted) Navigator.of(context).pop();
    isDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/smw.jpg"))),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              height: 80,
              width: 80,
              decoration:
                  BoxDecoration(color: HexColor("#3c3abe").withOpacity(0.5)),
              child: IconButton(
                onPressed: () async {
                  if (isPlaying) {
                    // await audioPlayer.stop();
                    await audioPlayer.dispose();
                  } else {
                    await playAudioFromUrl(
                        "https://stream.zeno.fm/s9ebrevcanhvv");
                  }
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
                icon: isPlaying
                    ? const Icon(
                        Icons.stop,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                iconSize: 60,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
