import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatelessWidget {
  final String songName;
  final String artistName;

  MusicPlayerScreen({required this.songName, required this.artistName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note, size: 100, color: Colors.pink.shade200),
            SizedBox(height: 20),
            Text(
              songName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              artistName,
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous, size: 40),
                  onPressed: () {
                    // Implement previous song functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.play_arrow, size: 40),
                  onPressed: () {
                    // Implement play/pause functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, size: 40),
                  onPressed: () {
                    // Implement next song functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
