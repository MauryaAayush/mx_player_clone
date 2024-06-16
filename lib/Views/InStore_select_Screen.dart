import 'package:flutter/material.dart';
import '../Model/InStore_List.dart';
import 'Download_play_Screen.dart';

class InstoreSelectScreen extends StatelessWidget {
  const InstoreSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text('Videos',style: TextStyle(
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
