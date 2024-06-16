import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../Model/InStore_List.dart';

class DownloadPlayScreen extends StatefulWidget {
  final String videoLink;

  const DownloadPlayScreen({Key? key, required this.videoLink}) : super(key: key);

  @override
  _DownloadPlayScreenState createState() => _DownloadPlayScreenState();
}

class _DownloadPlayScreenState extends State<DownloadPlayScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoLink);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      aspectRatio: 12 /20, // Adjust aspect ratio as per your video
      allowFullScreen: true,
      allowedScreenSleep: false,
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]); // Reset orientation settings
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
       leading: IconButton(onPressed: () {
         Navigator.pop(context);
       }, icon: Icon(Icons.arrow_back,color: Colors.white70,)),
      ),
      body: Center(
        child: Chewie(controller: _chewieController),
      ),
    );
  }
}
