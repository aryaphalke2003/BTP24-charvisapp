import './home.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/primary_button.dart';
// import 'package:flutter_animated_button/flutter_animated_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 0, 0, 0), // Darker background color

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: mainDefaultPadding),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Text(
                "Welcome to Charvis!",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white, // Title text color
                    ),
              ),
              const Spacer(flex: 2),
              Image.asset(
                "assets/images/logo.png",
                height: 250,
              ),
              const Spacer(flex: 2),

             
              PrimaryButton(
                
                color: mainSecondaryColor,
                text: "Tap To Enter", // Button text color
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
