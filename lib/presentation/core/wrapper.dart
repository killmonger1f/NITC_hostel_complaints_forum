import 'package:flutter/material.dart';
import 'package:movieapp/infrastructure/models/user.dart';
import 'package:movieapp/presentation/authentication/auth_toggle.dart';
import 'package:movieapp/presentation/core/login_option_screen.dart';
import 'package:movieapp/presentation/home/homepage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userid>(context);
    if (user == null) {
      return AuthToggle();
    } else {
      return HomePage();
    }
  }
}
