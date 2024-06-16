import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({required this.videoUrl, Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer(widget.videoUrl);
  }

  Future<void> initializePlayer(String url) async {
    videoPlayerController = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {});
        videoPlayerController.play();
      });

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Video Player'),
        leading: const Icon(Icons.menu),
      ),
      body: Column(
        children: [
          if (videoPlayerController.value.isInitialized)
            AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: Chewie(controller: chewieController),
            )
          else
            const Center(child: CircularProgressIndicator()),
          const SizedBox(height: 20),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              videoPlayerController.play();
            },
            icon: const Icon(Icons.play_circle),
          ),
          IconButton(
            onPressed: () {
              videoPlayerController.pause();
            },
            icon: const Icon(Icons.pause_circle),
          ),
        ],
      ),
    );
  }
}
