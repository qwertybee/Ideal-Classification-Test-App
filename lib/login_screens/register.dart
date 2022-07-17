 import 'package:firebase_auth/firebase_auth.dart';
 import 'package:firebase_core/firebase_core.dart';
 import 'package:flutter/material.dart';
import 'package:project_2/profile_screens/profilecontroller.dart';
import 'package:project_2/profile_screens/profilepage.dart';

 class RegisterScreen extends StatefulWidget {
   const RegisterScreen({Key? key}) : super(key: key);
   State<RegisterScreen> createState() => _RegisterScreenState();
 }

 class _RegisterScreenState extends State<RegisterScreen> {
   late FirebaseAuth _auth;
   bool _passwordVisible = false;
   final nameController = TextEditingController();
   final emailController = TextEditingController();
   final passwordController = TextEditingController();
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

   String? validateEmail(String? value) {
     String pattern =
         r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
         r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
         r"{0,253}[a-zA-Z0-9])?)*$";
     RegExp regex = RegExp(pattern);
     if (value == null || value.isEmpty || !regex.hasMatch(value))
       return 'Please enter a valid email address';
     else
       return null;
   }

   @override
   Widget build(BuildContext context) {
     return GestureDetector(
       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
       child: Scaffold(
           body: Container(
               padding: EdgeInsets.all(20.0),
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     SizedBox(height: MediaQuery.of(context).size.height/7),
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
                         padding: EdgeInsets.all(15.0),
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
                                   controller: nameController,
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
                                   controller: emailController,
                                   keyboardType: TextInputType.emailAddress,
                                   decoration: const InputDecoration(
                                     border: OutlineInputBorder(),
                                     hintText: 'E-mail address',),
                                   validator: (value) => validateEmail(value),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text(
                                       "Password"
                                   ),
                                 ),
                                 TextFormField(
                                   controller: passwordController,
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
                           child: const Text("Create Account"),
                           onPressed: () async {
                             FocusManager.instance.primaryFocus?.unfocus();
                             if (_formKey.currentState!.validate()) {
                               _formKey.currentState?.save();
                               try {
                                 final newUser = await _auth.createUserWithEmailAndPassword(
                                     email: emailController.text, password: passwordController.text);
                                 User? user = newUser.user;
                                 user?.updateDisplayName(nameController.text);

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
                         child: const Text("Return to Login"),
                       ),
                     ),
                   ],
                 ),
               )

           ),
         ),
     );
   }
 }