// import 'package:ai_assist/features/main/presentation/main_page.dart';
// import 'package:flutter/material.dart';
// import 'package:ai_assist/features/auth/presentation/my_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
//
// class SignInScreen extends StatefulWidget {
//   static const String screenRoute = 'signin_screen';
//
//   const SignInScreen({Key? key}) : super(key: key);
//
//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//   final _auth = FirebaseAuth.instance;
//   late String email;
//   late String password;
//   bool showSpinner = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(
//                 height: 180,
//                 child: Image.asset('assets/images/login.png'),
//               ),
//               const SizedBox(height: 50),
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
//                 onChanged: (value) {
//                   email = value;
//                 },
//                 decoration: InputDecoration(
//                   hintStyle: TextStyle(color: Colors.grey),
//                   hintText: 'Enter your Email',
//                   contentPadding: EdgeInsets.symmetric(
//                     vertical: 10,
//                     horizontal: 20,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.orange,
//                       width: 1,
//                     ),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.blue,
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextField(
//                 obscureText: true,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
//                 onChanged: (value) {
//                   password = value;
//                 },
//                 decoration: const InputDecoration(
//                   hintStyle: TextStyle(color: Colors.grey),
//                   hintText: 'Enter your password',
//                   contentPadding: EdgeInsets.symmetric(
//                     vertical: 10,
//                     horizontal: 20,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.orange,
//                       width: 1,
//                     ),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.blue,
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               MyButton(
//                 color: Colors.yellow[900]!,
//                 title: 'Sign in',
//                 onPressed: () async {
//                   setState(() {
//                     showSpinner = true;
//                   });
//                   try {
//                     final user = await _auth.signInWithEmailAndPassword(
//                         email: email, password: password);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MainPage()),
//                     );
//                     setState(() {
//                       showSpinner = false;
//                     });
//                                     } catch (e) {
//                     print(e);
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }