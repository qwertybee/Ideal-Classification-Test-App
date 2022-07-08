import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late FirebaseAuth _auth;
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          TextField(
            onChanged: (value) {
              email = value;
            },
            decoration: const InputDecoration(
              hintText: 'email',
            ),
          ),
          TextField(
            onChanged: (value) {
              password = value;
            },
            decoration: const InputDecoration(
              hintText: 'password',
            ),
          ),
          ElevatedButton(
              child: const Text('Create account'),
              onPressed: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                } catch (e) {
                  print(e);
                }
              }),
        ],
      ),
    );
  }
}