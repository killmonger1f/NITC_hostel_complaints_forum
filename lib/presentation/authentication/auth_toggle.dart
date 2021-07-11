import 'package:flutter/material.dart';
import 'package:movieapp/presentation/authentication/sign_in.dart';
import 'package:movieapp/presentation/authentication/sign_up.dart';
import 'package:movieapp/presentation/core/login_option_screen.dart';

class AuthToggle extends StatefulWidget {
  @override
  _AuthToggleState createState() => _AuthToggleState();
}

class _AuthToggleState extends State<AuthToggle> {
  bool loginoptionspage = true;
  bool signinpage = false;
  bool signuppage = false;
  void togglelogin() {
    setState(() {
      return loginoptionspage = !loginoptionspage;
    });
  }

  void togglesignin() {
    setState(() {
      return signinpage = !signinpage;
    });
  }

  void togglesignup() {
    setState(() {
      return signuppage = !signuppage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loginoptionspage == true) {
      return LoginOptions(
        togglelogin: togglelogin,
        togglesignin: togglesignin,
        togglesignup: togglesignup,
      );
    } else if (signinpage == true) {
      return SignInPage(
        togglelogin: togglelogin,
        togglesignin: togglesignin,
        togglesignup: togglesignup,
      );
    } else if (signuppage == true) {
      return SignUpPage(
        togglelogin: togglelogin,
        togglesignin: togglesignin,
        togglesignup: togglesignup,
      );
    }
  }
}
