import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:video_player/video_player.dart';

class ActionDetail extends StatefulWidget {
  @override
  _ActionDetailState createState() => _ActionDetailState();
}

class _ActionDetailState extends State<ActionDetail> {
  double _currentSliderValue = 20;

  List<String> items = [
    "The first instruction of the action item will be explained here",
    "The first instruction of the action item will be explained here",
    "The first instruction of the action item will be explained here",
    "The first instruction of the action item will be explained here"
  ];

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      body: SlidingUpPanel(
        panel: Container(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text("How to Action Name", style: TextStyle(fontSize: 24)),
              Expanded(
                  child:
                  ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(index.toString(), style: TextStyle(fontSize: 16),),
                        title: Text('${items[index]}'),
                      );
                    },
                  ),),

            ],
          ),

          ),

        collapsed: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: radius
          ),
          child: Center(
            child: Column(
              children: [
                Divider(),
                Text(
                  "Swipe up for details",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),

        // Video
        body:
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),

        borderRadius: radius,
      ),
    );
  }
}
