import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'music_player.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_cold.jpg"),
              fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0)),
          child: Scaffold(
            backgroundColor: Colors.black.withOpacity(0),
            appBar: AppBar(
              toolbarHeight: 80,
              backgroundColor: HexColor("#2d2e37"),
              elevation: 0,
              title:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset("assets/images/smw.jpg",
                    width: 48, height: 48, fit: BoxFit.fitHeight),
                const SizedBox(width: 10),
                Text(
                  "SpecialMusicWorld",
                  style: GoogleFonts.rubik(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ]),
            ),
            body: const Center(
              child: MusicPlayer(),
            ),
          ),
        ),
      ),
    );
  }
}
