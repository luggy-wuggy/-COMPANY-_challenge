import 'package:flutter/material.dart';

import './model/global.dart';
import './widgets/episode_container.dart';
import './widgets/head_display.dart';
import './widgets/tab_horizontal_scroll.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: "Auby", home: AubyApp());
  }
}

class AubyApp extends StatelessWidget {
  Widget bottomNavigation() {
    return BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        iconSize: 34,
        backgroundColor: Colors.grey[900],
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.grey[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), title: Text('My Auby')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), title: Text('Profile')),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigation(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.red[100]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            headDisplay(),
            SizedBox(height: 15),
            tabHorizontalScroll(),
            SizedBox(height: 10),
            Container(
              height: 400,
              width: 355,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ListView.builder(
                itemCount: dummyData.length,
                itemBuilder: (context, index) {
                  return EpisodeContainer(index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

