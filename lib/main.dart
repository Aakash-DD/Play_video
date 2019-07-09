import 'package:chewie/chewie.dart';
//import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({this.title="Video Chewie Demo"});
  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;


  @override
  void initState(){
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/"
            "butterfly.mp4");

    _chewieController = ChewieController(
      videoPlayerController : _videoPlayerController1,
      aspectRatio: 3/2,
      autoPlay: true,
      looping: true,

    );
  }

  @override
  void dispose(){
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: widget.title,
      theme: ThemeData.dark().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}





















