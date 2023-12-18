import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Color primaryPurple = const Color.fromARGB(202, 88, 12, 88);
  Color primaryGrey = const Color.fromARGB(255, 96, 96, 96);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: primaryPurple,
              ),
              child: CircleAvatar(
                radius: 100.0,
                backgroundColor: primaryPurple,
                child: Image.asset('assets/logo.png'),
              ),
            ),
            const SizedBox(height: 70.0),
            Text(
              'Welcome to your AI Assistant',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w400,
                color: primaryGrey,
              ),
            ),
            const SizedBox(height: 60.0),
            Text(
              'Login to use AI Assist services',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryGrey,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigated to sign in page
                },
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 15),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(primaryPurple),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 15),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(primaryGrey)),
                onPressed: () {
                  // Handle sign up
                },
                child: const Text('Register',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
