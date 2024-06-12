import 'package:expense_tracker/auth/toggle_state.dart';
import 'package:expense_tracker/home/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return (const Center(
              child: CircularProgressIndicator(),
            ));
          } else if (snapshot.hasError) {
            return (const Center(
              child: Text("Something went wrong !"),
            ));
          } else if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return  const ToggleScreen();
          }
        },),
    );
  }
}
