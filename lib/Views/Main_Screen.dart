import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.grid_view),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildFolderIcon(Icons.share, 'Share'),
                  _buildFolderIcon(Icons.music_note, 'Music'),
                  _buildFolderIcon(Icons.camera_alt, 'Downloader'),
                  _buildFolderIcon(Icons.lock, 'Privacy'),
                  _buildFolderIcon(Icons.playlist_add, 'Playlist'),
                  _buildFolderIcon(Icons.cloud_upload, 'M-Cloud'),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildFolderItem('1692881982577.mp4', '1 video'),
                  _buildFolderItem('Camera', '4 videos'),
                  _buildFolderItem('In-Store Downloader', '33 videos'),
                  _buildFolderItem('Instant Downloader', '1 video'),
                  _buildFolderItem('Internal memory', '2 videos'),
                  _buildFolderItem('Screen Record', '7 videos', number: 1),
                  _buildFolderItem('Snapchat', '4 videos'),
                  _buildFolderItem('Telegram', '5 videos'),
                  _buildFolderItem('Telegram Video', '5 videos'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Local',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: 'MXTube',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            label: 'MX Gold',
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.play_circle),
      ),
    );
  }

  Widget _buildFolderIcon(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(text),
        ),
      ],
    );
  }

  Widget _buildFolderItem(String title, String subtitle, {int? number}) {
    return ListTile(
      leading: Icon(Icons.folder),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: number != null ? CircleAvatar(
        radius: 12,
        backgroundColor: Colors.red,
        child: Text(number.toString()),
      ) : null,
    );
  }
}