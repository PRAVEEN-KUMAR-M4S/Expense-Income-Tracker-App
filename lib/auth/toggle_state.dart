import 'package:expense_tracker/auth/view/login_page.dart';
import 'package:expense_tracker/auth/view/reg_page.dart';
import 'package:flutter/cupertino.dart';

class ToggleScreen extends StatefulWidget {
  const ToggleScreen({super.key});

  @override
  State<ToggleScreen> createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  bool showLoginPage = true;
  void togglescreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        showregpage: togglescreen,
      );
    } else {
      return RegPage(showloginpage: togglescreen);
    }
  }
}
