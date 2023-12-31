import 'package:ai_assist/shared/supabase_services.dart';
import 'package:ai_assist/features/auth/presentation/my_button.dart';
import 'package:ai_assist/features/auth/presentation/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatelessWidget {
  final authServices;
  final BuildContext context;
  LoginPage({super.key, this.authServices, required this.context});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phrase = "Don\'t have an account?";

  // sign user in method
  void signUserIn() async {
    var response = await authServices.login(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    if (response.runtimeType == AuthResponse) {
      Navigator.pushNamed(context, "/homePage");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          response.message,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        duration: const Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        iconTheme: IconThemeData(
            color: MediaQuery.platformBrightnessOf(context).name == "dark"
                ? Theme.of(context).colorScheme.onInverseSurface
                : Theme.of(context).colorScheme.onSurface),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                Icon(
                  Icons.lock,
                  size: 150,
                  color: MediaQuery.platformBrightnessOf(context).name == "dark"
                      ? Theme.of(context).colorScheme.onInverseSurface
                      : Theme.of(context).colorScheme.onSurface,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome back we missed you!',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // Don't have an account?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, "/signUpPage");
                        },
                        child: Text(
                          phrase,
                          style: TextStyle(
                            color: MediaQuery.platformBrightnessOf(context)
                                        .name ==
                                    "dark"
                                ? Theme.of(context).colorScheme.onInverseSurface
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: signUserIn,
                  content: "Login",
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
