import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/infrastructure/models/user.dart';
import 'package:movieapp/infrastructure/services/auth_service.dart';
import 'package:movieapp/presentation/authentication/sign_in.dart';
import 'package:movieapp/presentation/authentication/sign_up.dart';
import 'package:movieapp/presentation/core/login_option_screen.dart';
import 'package:movieapp/presentation/core/routes.dart';
import 'package:movieapp/presentation/core/wrapper.dart';
import 'package:movieapp/presentation/home/homepage.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userid>.value(
      initialData: null,
      value: AuthServices().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
              GoogleFonts.comingSoonTextTheme(Theme.of(context).textTheme),
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              labelStyle: TextStyle(fontWeight: FontWeight.bold)),
        ),
        routes: {
          '/login': (context) => Wrapper(),
        },
        home: Wrapper(),
      ),
    );
  }
}
