import 'package:flutter/material.dart';
import 'package:mx_player_clone/Views/play_Screen.dart';

class VideoSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'title': 'Big Buck Bunny',
      'url': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
    },
    {
      'title': 'Elephant Dream',
      'url': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4'
    },
    {
      'title': 'Sintel',
      'url': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4'
    },
  ];

  VideoSelectionScreen({Key? key}) : super(key: key);

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
