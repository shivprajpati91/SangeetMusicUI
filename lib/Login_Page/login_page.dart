import 'package:design_1/Home_Screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../Language_Screen/language_selection.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showFields = false;

  @override
  void initState() {
    super.initState();
    // Delay animation to make fields appear smoothly
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        showFields = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Title with Icon
              Column(
                children: [
                  Icon(
                    Icons.headphones,
                    size: 80,
                    color: Colors.pinkAccent,
                  ),
        
                  Text(
                    "संGeeT",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.1,),
              // Animated Email Field
              AnimatedOpacity(
                opacity: showFields ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: AnimatedPadding(
                  duration: Duration(seconds: 1),
                  padding: EdgeInsets.only(top: showFields ? 0 : 50),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white54),
                      prefixIcon: Icon(Icons.email, color: Colors.white54),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white38),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      filled: true,
                      fillColor: Colors.white10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
              // Animated Password Field
              AnimatedOpacity(
                opacity: showFields ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: AnimatedPadding(
                  duration: Duration(seconds: 1),
                  padding: EdgeInsets.only(top: showFields ? 0 : 50),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white54),
                      prefixIcon: Icon(Icons.lock, color: Colors.white54),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white38),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      filled: true,
                      fillColor: Colors.white10,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot Password logic
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.pinkAccent),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
              // Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>CustomizedLanguageSelectionPage()));
                  // Login logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
              // Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white38,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "OR",
                      style: TextStyle(color: Colors.white38),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white38,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
              // Google Login Button
              ElevatedButton.icon(
                onPressed: () {
                  // Google login logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                icon: Icon(Icons.g_mobiledata, color: Colors.black, size: 28),
                label: Text(
                  "Login with Google",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
           SizedBox(height: MediaQuery.sizeOf(context).height*0.12,),
              Row(
        
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white54),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup'); // Navigate to Sign Up Page
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.pinkAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
