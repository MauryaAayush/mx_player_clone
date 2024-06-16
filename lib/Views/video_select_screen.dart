import 'package:flutter/material.dart';
import 'package:mx_player_clone/Views/play_Screen.dart';

import '../Model/Video_Lists.dart';

class VideoSelectionScreen extends StatelessWidget {
  const VideoSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Video Selection'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(videos[index]['title']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(videoUrl: videos[index]['url']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
