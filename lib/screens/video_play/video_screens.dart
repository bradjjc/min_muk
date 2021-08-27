import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {

  final String id;

  VideoScreen({this.id});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  YoutubePlayerController _controller;
  // YoutubePlayerController _controller = YoutubePlayerController(
  //   initialVideoId: 'iLnmTe5Q2Qw',
  //   flags: YoutubePlayerFlags(
  //     autoPlay: true,
  //     mute: true,
  //   ),
  // );


  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        loop: true,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Plays the video once the widget is build and loaded.
      _controller.play();
    });
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.5,
        centerTitle: true,
        title: Text('',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: <Color>[
                Colors.purple,
                Colors.lightBlueAccent,
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:150.0),
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,

          onReady: () {
            print('Player is ready.');
          },
        ),
      ),
    );
  }
}