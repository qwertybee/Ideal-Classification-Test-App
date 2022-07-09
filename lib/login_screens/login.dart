// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen>{
//   late FirebaseAuth _auth;
//   String email = '';
//   String password = '';
//
//   @override
//   void initState() {
//     super.initState();
//     initFirebase();
//   }
//
//   void initFirebase() async {
//     await Firebase.initializeApp();
//     _auth = FirebaseAuth.instance;
//   }
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   email = value;
//                 });
//                 },
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 ),
//               onChanged: (value) {
//                 setState(() {
//                   password = value;
//                 });
//                 },
//               ),
//             ElevatedButton(
//               child: Text('Login'),
//               onPressed: () async{
//                 print('Email: $email');
//                 print('Password: $password');
//                 try{
//                   final user = await _auth.signInWithEmailAndPassword(
//                     email: email,
//                     password: password,
//                   );
//                   if (user != null){
//                     print('Signed in');
//                   }
//                   else{
//                     print('Error');
//                   }
//                 }
//                 catch (e){
//                   print(e);
//                 }}
//               ),
//             ElevatedButton(
//               child: Text('Register'),
//               onPressed: () async{
//                 final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//               },
//               ),
//             ],
//           ),
//         ),
//       );
//   }
// }
