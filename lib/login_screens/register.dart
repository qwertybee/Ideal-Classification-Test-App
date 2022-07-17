 import 'package:firebase_auth/firebase_auth.dart';
 import 'package:firebase_core/firebase_core.dart';
 import 'package:flutter/material.dart';
import 'package:project_2/profile_screens/profilecontroller.dart';
import 'package:project_2/profile_screens/profilepage.dart';

 class RegisterScreen extends StatefulWidget {
   @override
   State<RegisterScreen> createState() => _RegisterScreenState();
 }

 class _RegisterScreenState extends State<RegisterScreen> {
   late FirebaseAuth _auth;
   bool _passwordVisible = false;
   String name = '';
   String email = '';
   String password = '';
   final _formKey = GlobalKey<FormState>();

   @override
   void initState() {
     super.initState();
     _passwordVisible = false;
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
           SizedBox(height: 40),
           Text("Account Registration",
             style: TextStyle(
               fontSize: 28, color: Color(0xFF0D1333), fontWeight: FontWeight.bold,
             ),
           ),
           SizedBox(height: 2),
           Text("Register now and enjoy benefits from our app!",
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 20, color: Color(0xFF61688B),
             ),
           ),
           Container(
             child: Padding(
               padding: EdgeInsets.all(8.0),
               child: Form(
                 key: _formKey,
                 child: SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(
                             "Name"
                         ),
                       ),
                       TextFormField(
                         onSaved: (String? value){
                           if (value != null){
                             name = value;
                           }
                         },
                         keyboardType: TextInputType.emailAddress,
                         decoration: const InputDecoration(
                             border: OutlineInputBorder(),
                             hintText: 'Name',),
                         validator: (value) {
                           if (value == null || value.isEmpty) {
                             return 'Please enter your name';
                           }
                           return null;
                         },
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(
                             "E-mail address"
                         ),
                       ),
                       TextFormField(
                         onSaved: (String? value){
                           if (value != null){
                             email = value;
                           }
                         },
                         keyboardType: TextInputType.emailAddress,
                         decoration: const InputDecoration(
                             border: OutlineInputBorder(),
                             hintText: 'Enter your amount here'),
                         validator: (value) {
                           if (value == null || value.isEmpty) {
                             return 'Please enter your e-mail address';
                           }
                           return null;
                         },
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(
                             "Password"
                         ),
                       ),
                       TextFormField(
                         onSaved: (String? value){
                           if (value != null){
                             password = value;
                           }
                         },
                         obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(_passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                         keyboardType: TextInputType.visiblePassword,

                         validator: (value) {
                           if (value == null || value.isEmpty) {
                             return 'Your password cannot be empty';
                           }
                           else if(value.length < 6){
                             return 'Your password must be at least 6 characters';
                           }
                           return null;
                         },
                       ),
                     ],
                   ),
                 ),
               ),
             ),
           ),
           SizedBox(height: 20),
           SizedBox(
             width: 300,
             height: 40,
             child: TextButton(
               style: ButtonStyle(
                   foregroundColor: MaterialStateProperty.all(Colors.white),
                   backgroundColor: MaterialStateProperty.all(Colors.purple),
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12.0),
                           side: const BorderSide(color: Colors.purple)
                       )
                   )
               ),
               child: const Text("Create account"),
                 onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      try {
                         final newUser = await _auth.createUserWithEmailAndPassword(
                         email: email, password: password);
                         User? user = newUser.user;
                         user?.updateDisplayName(name);

                         ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text('Registration successful!')),);

                         // Temporary fix so that you can still see the nav screen on the profile page
                         Navigator.pop(context);
                         //Navigator.push(
                            //context, MaterialPageRoute(builder: (context) => Profile()));
                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Registration failed.')),);
                        }
                      }
                   }
             ),
           ),

           SizedBox(height: 20),
           SizedBox(
             width: 300,
             height: 40,
             child: TextButton(
               style: ButtonStyle(
                   foregroundColor: MaterialStateProperty.all(Colors.white),

                   backgroundColor: MaterialStateProperty.all(Color(0xFFFF6F61)),
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12.0),
                           side: const BorderSide(color: Color(0xFFFD6E61))
                       )
                   )
               ),
               onPressed: () {
                 Navigator.pop(context);
               },
               child: const Text("Cancel"),
             ),
           ),
         ],
       ),
     );
   }
 }