import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_2/profile_screens/change_password.dart';
import 'package:project_2/profile_screens/edit_user_info.dart';

class ProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(height: 24),
            buildName(user),

            SizedBox(height: 40),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.edit_note_rounded, size: 32),
                label: Text(
                  'Edit user information',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () => changeUserDetailAlert(context, user)
            ),

            SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(Icons.key_rounded, size: 32),
              label: Text(
                'Change Password',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => changePasswordAlert(context, user)
            ),

            SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(Icons.exit_to_app_rounded, size: 32),
              label: Text(
                'Sign Out',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                try{
                  FirebaseAuth.instance.signOut();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Signed out successfully!')),);
                }
                catch(e){
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to sign out, please try again later.')),);
                  }
                },
            ),

          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        'Hello, ' + user.displayName.toString() + '!',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email.toString(),
        style: TextStyle(color: Colors.grey),
      )
    ],
  );


}