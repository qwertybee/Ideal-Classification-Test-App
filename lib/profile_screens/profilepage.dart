import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_2/profile_screens/change_password.dart';
import 'package:project_2/profile_screens/edit_user_info.dart';
import 'package:project_2/question_screens/history_screens/view_firebase_history.dart';

class ProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(50.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              buildName(user),

              SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 40,
                child: TextButton.icon(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),

                    backgroundColor: MaterialStateProperty.all(Color(0xFF534293)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(color: Color(0xFF534293))
                        )
                    ),
                  ),
                    icon: Icon(Icons.list_alt_rounded),
                    label: Text(
                      'View Test History',
                    ),
                    onPressed: () {
                      try {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ViewFirebaseHistory()
                              ,
                            )
                        );
                      }
                      on StateError catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('No Test History found!')),);
                      }
                    }

                ),
              ),

              SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 40,
              child:TextButton.icon(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),

                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(color: Colors.purple)
                        )
                    ),
                  ),

                  icon: Icon(Icons.edit_note_rounded),
                  label: Text(
                    'Edit User Information',
                  ),
                  onPressed: () => changeUserDetailAlert(context, user)
                ),
              ),

              SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 40,
                child: TextButton.icon(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),

                      backgroundColor: MaterialStateProperty.all(Color(0xFF05BBAA)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                              side: const BorderSide(color: Color(0xFF05BBAA))
                          )
                      ),
                    ),
                  icon: Icon(Icons.key_rounded),
                  label: Text(
                    'Change Password',
                  ),
                  onPressed: () => changePasswordAlert(context, user)
                ),
              ),

              SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 40,
                child: TextButton.icon(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),

                    backgroundColor: MaterialStateProperty.all(Color(0xFFEB5951)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(color: Color(0xFFEB5951))
                        )
                    ),
                  ),
                  icon: Icon(Icons.exit_to_app_rounded),
                  label: Text(
                    'Sign Out',
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
              ),
            ],
          ),
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