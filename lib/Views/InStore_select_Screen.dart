import 'package:flutter/material.dart';
import '../Model/InStore_List.dart';
import 'Download_play_Screen.dart';

class InstoreSelectScreen extends StatelessWidget {
  const InstoreSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Video'),
      ),
      body: ListView.builder(
        itemCount: inStore.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.video_library),
            title: Text(inStore[index]['title'] ?? ''),
            onTap: () {
              // Handle video selection here
              String? videoLink = inStore[index]['link'];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DownloadPlayScreen(videoLink: videoLink!),
                ),
              );
              // Add code to play the selected video
            },
          );
        },
      ),
    );
  }
}
