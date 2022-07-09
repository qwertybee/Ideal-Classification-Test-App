 import 'package:firebase_auth/firebase_auth.dart';
 import 'package:firebase_core/firebase_core.dart';
 import 'package:flutter/material.dart';

 class LoginScreen extends StatefulWidget {
   const LoginScreen({Key? key}) : super(key: key);
   State<LoginScreen> createState() => _LoginScreenState();
 }

 class _LoginScreenState extends State<LoginScreen>{
   final emailController = TextEditingController();
   final passwordController = TextEditingController();

   @override
   void dispose(){
     emailController.dispose();
     passwordController.dispose();
     super.dispose();
   }

   @override
   Widget build(BuildContext context) => SingleChildScrollView(
     padding: EdgeInsets.all(20),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         SizedBox(height: 20),
         TextField(
           controller: emailController,
           cursorColor: Colors.black,
           textInputAction: TextInputAction.next,
           decoration: InputDecoration(
             hintText: 'Email',
             labelText: 'Email',
           ),
         ),
         SizedBox(height: 4),
         TextField(
           controller: passwordController,
           cursorColor: Colors.black,
           obscureText: true,
           textInputAction: TextInputAction.done,
           decoration: InputDecoration(
             hintText: 'Password',
             labelText: 'Password'
           ),
         ),
         SizedBox(height: 20),
         ElevatedButton.icon(icon: Icon(Icons.lock_open_outlined), label: Text('Login', style: TextStyle(fontSize: 24)),
         onPressed: () async {
           try {
             final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                 email: emailController.text.trim(), password: passwordController.text.trim());
             //Navigator.push(context, MaterialPageRoute(builder: (context) => Display(user: user)));
           } catch (e) {
             print(e);
           }
         }),
       ],
     ),
   );
 }
