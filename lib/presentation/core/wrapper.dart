import 'package:flutter/material.dart';
import 'package:movieapp/infrastructure/models/user.dart';
import 'package:movieapp/presentation/authentication/auth_toggle.dart';
import 'package:movieapp/presentation/core/login_option_screen.dart';
import 'package:movieapp/presentation/home/homepage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userid>(context);
    if (user == null) {
      return AuthToggle();
    } else {
      return HomePage();
    }
    // return HomePage();
  }
}
