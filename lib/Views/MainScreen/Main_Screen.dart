import 'package:flutter/material.dart';
import '../InStore_select_Screen.dart';
import '../video_select_screen.dart';

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
      backgroundColor: Color(0xFF16202A),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Folders",
          style: TextStyle(color: Colors.white),
        ),
        actionsIconTheme: const IconThemeData(color: Colors.white),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildFolderIcon(Icons.share, 'Share'),
                    _buildFolderIcon(Icons.music_note, 'Music'),
                    _buildFolderIcon(Icons.camera_alt, 'Downloader'),
                    _buildFolderIcon(Icons.lock, 'Privacy'),
                    _buildFolderIcon(Icons.playlist_add, 'Playlist'),
                    _buildFolderIcon(Icons.cloud_upload, 'M-Cloud'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const VideoSelectionScreen(),
                        ));
                      },
                      child: _buildFolderItem('Cartoons', '20 video')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InstoreSelectScreen(),
                        ));
                      },
                      child: _buildFolderItem('Camera', '21 videos')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InstoreSelectScreen(),
                        ));
                      },
                      child: _buildFolderItem('In-Store Downloader', '21 videos')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InstoreSelectScreen(),
                        ));
                      },
                      child: _buildFolderItem('Instant Downloader', '1 video')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InstoreSelectScreen(),
                        ));
                      },
                      child: _buildFolderItem('Internal memory', '2 videos')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InstoreSelectScreen(),
                        ));
                      },
                      child: _buildFolderItem('Screen Record', '7 videos', number: 1)),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InstoreSelectScreen(),
                        ));
                      },
                      child: _buildFolderItem('Snapchat', '4 videos')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InstoreSelectScreen(),
                        ));
                      },
                      child: _buildFolderItem('Telegram', '5 videos')),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const InstoreSelectScreen(),
                        ));
                      },
                      child: _buildFolderItem('Telegram Video', '5 videos')),
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
            backgroundColor: Color(0xFF1C2939),
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
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        onPressed: () {},
        child: Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }

  Widget _buildFolderItem(String title, String subtitle, {int? number}) {
    return ListTile(
      leading: Icon(
        Icons.folder,
        size: 85,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white70),
      ),
      subtitle: Text(subtitle),
    );
  }
}

Widget _buildFolderIcon(IconData icon, String text) {
  return Column(
    children: <Widget>[
      Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.grey.shade800.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30)),
          child: Icon(
            icon,
            color: Colors.white70,
            size: 18,
          )),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          text,
          style: TextStyle(color: Colors.white70),
        ),
      ),
    ],
  );
}
