import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../Player_Screen/player_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<String> selectedLanguages;

  HomeScreen({required this.selectedLanguages});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool _isSearchVisible = false;
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final Map<String, List<Map<String, String>>> songsData = {
    "English": [
      {"song": "Shape of You", "artist": "Ed Sheeran"},
      {"song": "Blinding Lights", "artist": "The Weeknd"},
      {"song": "Levitating", "artist": "Dua Lipa"},
    ],
    "Hindi": [
      {"song": "Tum Hi Ho", "artist": "Arijit Singh"},
      {"song": "Dil Diyan Gallan", "artist": "Atif Aslam"},
      {"song": "Kabira", "artist": "Arijit Singh & Harshdeep Kaur"},
    ],
  };

  final List<Map<String, String>> trendingSongs = [
    {"song": "Stay", "artist": "The Kid LAROI & Justin Bieber"},
    {"song": "Good 4 U", "artist": "Olivia Rodrigo"},
    {"song": "Industry Baby", "artist": "Lil Nas X & Jack Harlow"},
    {"song": "Kiss Me More", "artist": "Doja Cat ft. SZA"},
    {"song": "Montero (Call Me By Your Name)", "artist": "Lil Nas X"},
  ];

  final List<Map<String, String>> popularSongs = [
    {"song": "As It Was", "artist": "Harry Styles"},
    {"song": "Easy On Me", "artist": "Adele"},
    {"song": "Cold Heart", "artist": "Elton John & Dua Lipa"},
  ];

  final List<Map<String, String>> newReleases = [
    {"song": "Shivers", "artist": "Ed Sheeran"},
    {"song": "Take My Breath", "artist": "The Weeknd"},
    {"song": "Save Your Tears", "artist": "The Weeknd & Ariana Grande"},
  ];

  final List<Map<String, String>> topHits = [
    {"song": "Levitating", "artist": "Dua Lipa"},
    {"song": "Bad Habits", "artist": "Ed Sheeran"},
    {"song": "Blinding Lights", "artist": "The Weeknd"},
  ];

  final List<Map<String, String>> classics = [
    {"song": "Imagine", "artist": "John Lennon"},
    {"song": "Bohemian Rhapsody", "artist": "Queen"},
    {"song": "Hotel California", "artist": "Eagles"},
  ];

  late TabController _tabController;
  Map<String, String>? bestSong;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    bestSong = songsData[widget.selectedLanguages.first]?.first;
  }

  Widget _buildHorizontalList(String title, List<Map<String, String>> songs) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Show bottom sheet for song player
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return MusicPlayerScreen(
                          songName: songs[index]["song"]!,
                          artistName: songs[index]["artist"]!,
                        );
                      },
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.pinkAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            songs[index]["song"]!,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            songs[index]["artist"]!,
                            style: TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeeAllButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Implement your action for "See All"
        },
        child: Text(
          "See All",
          style: TextStyle(
            color: Colors.pink.shade200,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter the songs based on selected languages
    List<Map<String, String>> selectedSongs = [];
    for (var language in widget.selectedLanguages) {
      selectedSongs.addAll(songsData[language] ?? []);
    }

    List<Map<String, String>> filteredSongs = selectedSongs.where((song) {
      return song["song"]!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("संGeeT"),
        backgroundColor: Colors.pink.shade200,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearchVisible = !_isSearchVisible;
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.pinkAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("User Name"),
              accountEmail: Text("user@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.pinkAccent),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              color: Colors.pinkAccent,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      bestSong != null
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Best Song",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            bestSong!["song"]!,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            bestSong!["artist"]!,
                            style: TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                        ],
                      )
                          : Container(),
                      IconButton(
                        icon: Icon(Icons.play_arrow, color: Colors.white),
                        onPressed: () {
                          // Implement play functionality here
                        },
                      ),
                    ],
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: _isSearchVisible ? 50 : 0,
                    child: Visibility(
                      visible: _isSearchVisible,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search Songs...',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                        onChanged: (query) {
                          setState(() {
                            _searchQuery = query;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(text: "Trending"),
                      Tab(text: "Popular"),
                      Tab(text: "New Releases"),
                      Tab(text: "Top Hits"),
                      Tab(text: "Classics"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red.shade100),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildHorizontalList("Trending Songs", trendingSongs),
                        _buildHorizontalList("Popular Songs", popularSongs),
                        _buildHorizontalList("New Releases", newReleases),
                        _buildHorizontalList("Top Hits", topHits),
                        _buildHorizontalList("Classics", classics),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // New Section: Most Popular Songs List at the Bottom
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Most Popular Songs",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredSongs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Show bottom sheet for song player
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return MusicPlayerScreen(
                                  songName: filteredSongs[index]["song"]!,
                                  artistName: filteredSongs[index]["artist"]!,
                                );
                              },
                            );
                          },
                          child: Card(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.pinkAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    filteredSongs[index]["song"]!,
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                  Text(
                                    filteredSongs[index]["artist"]!,
                                    style: TextStyle(fontSize: 14, color: Colors.white70),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  _buildSeeAllButton(), // "See All" button
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.pink.shade200,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.settings, title: 'Settings'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
