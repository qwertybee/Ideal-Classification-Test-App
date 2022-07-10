import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Sign out'),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
        ),
      ),
    );
  }
}