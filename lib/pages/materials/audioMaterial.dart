import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AudioMaterial extends StatefulWidget {
  @override
  _AudioMaterialState createState() => _AudioMaterialState();
}

class _AudioMaterialState extends State<AudioMaterial> {
  //we will need some variables
  bool playing = false; // at the begining we are not playing any song
  IconData playBtn = Icons.play_arrow; // the main state of the play button icon

  //Now let's start by creating our music player
  //first let's declare some object
  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  //we will create a custom slider

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.red,
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  //let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  //Now let's initialize our player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //now let's handle the audioplayer time

    //this function will allow you to get the music duration
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    //this function will allow us to move the cursor of the slider while we are playing the song
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _player.stop();
        Navigator.pop(context);
      },
    child:
      Scaffold(
      appBar: AppBar(
        title: Text("Audio Session",
        style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white),

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 48.0,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 30, left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Let's add the music cover
                      Expanded(
                            child: Image.asset("assets/images/coverpodkes.png"),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Cardiovascular Disease Fact",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "with dr. Zackie",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Chip(label: Text("Tips & Trick", style: TextStyle(fontSize: 14), textAlign: TextAlign.left), backgroundColor: Colors.grey[300]),
                          SizedBox(width: 10),
                          Chip(label: Text("Facts", style: TextStyle(fontSize: 14), textAlign: TextAlign.left), backgroundColor: Colors.grey[300]),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        "Cardiovascular Disease (CVDs) is the number 1 cause of death globally."
                            " Even though the efforts to prevent it are quite simple,"
                            " most of the people still do not have any idea about what"
                            " caused it and how to prevent it. In this episode, we asked"
                            " dr. Zackie about facts related to CVDs, from the cases into the"
                            " simple daily routines that helps us avoid getting CVDs.",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),

                    ],
                  ),
                ),
                ),

                // play indicator
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Let's start by adding the controller
                      //let's add the time indicator text
                      SizedBox(height: 30),
                      Container(
                        width: 500.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            slider(),
                            Text(
                              "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 45.0,
                            color: Colors.grey,
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_previous,
                            ),
                          ),
                          IconButton(
                            iconSize: 62.0,
                            color: Colors.grey[800],
                            onPressed: () {
                              //here we will add the functionality of the play button
                              if (!playing) {
                                //now let's play the song
                                cache.play("audio/podcast.mp3");
                                setState(() {
                                  playBtn = Icons.pause;
                                  playing = true;
                                });
                              } else {
                                _player.pause();
                                setState(() {
                                  playBtn = Icons.play_arrow;
                                  playing = false;
                                });
                              }
                            },
                            icon: Icon(
                              playBtn,
                            ),
                          ),
                          IconButton(
                            iconSize: 45.0,
                            color: Colors.grey,
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_next,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    )
      ,);
  }
}