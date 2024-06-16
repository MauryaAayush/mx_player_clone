import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mx_player_clone/Views/play_Screen.dart';

import '../Model/video_lists.dart';

class VideoSelectionScreen extends StatelessWidget {
  const VideoSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF16202A),
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),

      actionsIconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.search)),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.filter_alt_outlined))
        ],
        elevation: 10,
        centerTitle: true,
        title: const Text('Cartoon',style: TextStyle(
          color: Colors.white
        ),),

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1D354F),
                Color(0xFF16202A),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 56,
                    child: CachedNetworkImage(
                      imageUrl: videos[index]['thumbnail']!,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.video_call,color: Colors.white),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ListTile(
                      trailing: Icon(Icons.more_vert,color: Colors.white,),
                      title: Text(videos[index]['title']!,style: TextStyle(
                        color: Colors.white
                      ),),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(videoUrl: videos[index]['url']!),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
