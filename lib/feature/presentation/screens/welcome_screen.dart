// ignore_for_file: prefer_const_constructors,  prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp_clone_app/feature/presentation/screens/registration_screen.dart';
import 'package:whatsapp_clone_app/feature/presentation/widgets/theme/style.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to WhatsApp Clone',
                style: TextStyle(
                  fontSize: 20,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 290,
                height: 290,
                child: Image.asset('assets/images/brand.png'),
              ),
              Column(
                children: [
                  Text(
                    "Read our Privacy Policy Tap, 'Agree and continue' to accept the Terms of Service",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    color: greenColor,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ),
                    ),
                    child: Text(
                      'AGREE AND CONTINUE',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
