 import 'package:firebase_auth/firebase_auth.dart';
 import 'package:firebase_core/firebase_core.dart';
 import 'package:flutter/material.dart';
import 'package:project_2/login_screens/register.dart';
import 'package:project_2/profile_screens/profilepage.dart';

 class LoginScreen extends StatefulWidget {
   const LoginScreen({Key? key}) : super(key: key);
   State<LoginScreen> createState() => _LoginScreenState();
 }

 class _LoginScreenState extends State<LoginScreen>{
   final emailController = TextEditingController();
   final passwordController = TextEditingController();

   @override
   void initState() {
     super.initState();
     _passwordVisible = false;
   }

   bool _passwordVisible = false;

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
         SizedBox(height: 30),
         Text("Profile",
           style: TextStyle(
             fontSize: 28, color: Color(0xFF0D1333), fontWeight: FontWeight.bold,
           ),
         ),
         Text("Please sign in to continue",
           style: TextStyle(
             fontSize: 24, color: Color(0xFF61688B),
           ),
         ),
         SizedBox(height: 20),
         Container(
         child: Padding(
         padding: EdgeInsets.all(8.0),
           child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                   "E-mail address"
               ),
             ),
             TextField(
               controller: emailController,
               cursorColor: Colors.black,
               keyboardType: TextInputType.emailAddress,
               textInputAction: TextInputAction.next,
               decoration: const InputDecoration(
                 border: OutlineInputBorder(),
                 hintText: 'E-mail address',),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                   "Password"
               ),
             ),
             TextField(
               controller: passwordController,
               cursorColor: Colors.black,
               textInputAction: TextInputAction.done,
               keyboardType: TextInputType.visiblePassword,
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
             ),
            ])
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
             onPressed: () async {
               try {
                 final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                     email: emailController.text.trim(), password: passwordController.text.trim());
                 //Navigator.push(context, MaterialPageRoute(builder: (context) => Display(user: user)));
               } catch (e) {
                 print(e);
               }
             },
             child: const Text("Log in"),
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
             onPressed: () async {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
               },
             child: const Text("Register"),
           ),
         ),
       ],
     ),
   );
 }
