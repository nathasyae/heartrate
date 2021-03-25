import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ActionDetail extends StatefulWidget {
  int index;
  List<bool> isDone;
  String url;
  List<String> items;

  ActionDetail({this.index, this.isDone, this.url, this.items});

  @override
  _ActionDetailState createState() => _ActionDetailState();
}

class _ActionDetailState extends State<ActionDetail> {
  double _currentSliderValue = 20;
  bool videoPrepared = false;

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.url
    );
    prepareVideo();
    _controller.play();
  }

  prepareVideo() async {
    await _controller.initialize();
    setState(){
      videoPrepared = true;
    }
    _controller.setVolume(1.0);
    _controller.setLooping(true);
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      appBar: AppBar(
          title: Text("Action name", style: TextStyle(color: Colors.black),),
          actions: <Widget>[
          TextButton(
            onPressed: () {
              widget.isDone[widget.index] = true;
              Navigator.pop(context, widget.isDone);
            },
            child: Text('Done', style: TextStyle(fontSize: 16, color: Colors.black)),
          ),
        ]
      ),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context, widget.isDone);
        },
        child: SlidingUpPanel(
          panel: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text("How to Action Name", style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Expanded(
                  child:
                  ListView.builder(
                    itemCount: widget.items.length,
                    itemBuilder: (context, index) {
                      return
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ListTile(
                              leading: Text(index.toString(), style: TextStyle(fontSize: 16),),
                              title: Text('${widget.items[index]}'),
                            ));
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
                  ImageIcon(AssetImage("assets/images/arrowup.png"), size: 40,),
                  Text(
                    "Swipe up for details",
                    style: TextStyle(color: Colors.black, fontSize: 16),
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
              return videoPrepared ? CircularProgressIndicator() :
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            },
          ),

          borderRadius: radius,
        ),
      )
    );
  }
}
