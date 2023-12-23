import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  shape: BoxShape.circle
                ),
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              const SizedBox(height: 70.0),
              Text(
                'Welcome to your AI Assistant',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 60.0),
              Text(
                'Login to use AI Assist services',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/loginPage");
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
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.inversePrimary),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onSecondaryContainer),
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
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.secondaryContainer)),
                  onPressed: () {
                    // Handle sign up
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => RegistrationScreen()),
                    // );
                    Navigator.of(context).pushNamed("/signUpPage");
                  },
                  child: Text('Register',
                      style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
