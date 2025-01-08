import 'package:design_1/Login_Page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.deepPurple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // PageView for Onboarding Slides
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2; // Update for the last page
              });
            },
            children: [
              buildPage(
                title: "Welcome to संGeeT",
                description: "Discover and enjoy your favorite music anytime, anywhere.",
                icon: Icons.headphones,
                color: Colors.white,
              ),
              buildPage(
                title: "Personalized Playlists",
                description: "Create and manage playlists tailored to your mood.",
                icon: Icons.playlist_play,
                color: Colors.white,
              ),
              buildPage(
                title: "Offline Mode",
                description: "Download music to listen without an internet connection.",
                icon: Icons.cloud_download,
                color: Colors.white,
              ),
            ],
          ),
          // Smooth Page Indicator
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: WormEffect(
                    dotColor: Colors.white38,
                    activeDotColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                isLastPage
                    ? ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 30.0),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget to Build a Single Page
  Widget buildPage({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circle Icon Container
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 120,
              color: color,
            ).animate().scale(

              duration: Duration(seconds: 1),
            ),
          ),
          SizedBox(height: 30),
          // Title Text
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fadeIn(duration: Duration(seconds: 1)),
          SizedBox(height: 15),
          // Description Text
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ).animate().moveY(
            begin: 30.0, // Starts below the screen
            end: 0.0,    // Moves to its original position
            duration: Duration(seconds: 1),
          ),
        ],
      ),
    );
  }
}
