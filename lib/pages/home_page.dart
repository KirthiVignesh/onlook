// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Signed In as: ${user.email!}'),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.indigo,
              child: Text('sign out'),
            )
          ],
        ),
      )),
      bottomNavigationBar: Container(
        color: Colors.indigo,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Color.fromRGBO(121, 134, 203, 1),
              backgroundColor: Colors.indigo,
              padding: EdgeInsets.all(16),
              gap: 8,
              onTabChange: (index) {
                print(index);
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.event_available_outlined,
                  text: 'Events',
                ),
                GButton(
                  icon: Icons.calendar_month_outlined,
                  text: 'Calendar',
                ),
                GButton(
                  icon: Icons.account_circle_outlined,
                  text: 'Profile',
                ),
              ]),
        ),
      ),
    );
  }
}
