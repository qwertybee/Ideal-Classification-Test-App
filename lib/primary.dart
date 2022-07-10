import 'package:flutter/material.dart';
import 'package:project_2/exploration_screens/explore.dart';
import 'package:project_2/profile_screens/profilepage.dart';
import 'package:project_2/question_screens/test_intro.dart';

class Primary extends StatefulWidget {
  const Primary({Key? key}) : super(key: key);

  @override
  State<Primary> createState() => _PrimaryState();
}

class _PrimaryState extends State<Primary> {
  int currentIndex = 0;
  final screens = [const Explore(), const TestIntro(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),

        bottomNavigationBar: BottomNavigationBar(
          // nav bar is not persistent across pages, fix later
          onTap: ((index) {
            setState(() {
              currentIndex = index;
            });
          }),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.explore_rounded),
                label: 'Explore'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.summarize_outlined),
              label: 'Test',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
          iconSize: 30.0,
          currentIndex: currentIndex,
          selectedItemColor: Color(0xff33a474),
          unselectedItemColor: Colors.grey,
          // showSelectedLabels: false,
          // showUnselectedLabels: true,
        ),
      ),
    ],
    );
  }
}
