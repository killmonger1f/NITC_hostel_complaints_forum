import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/presentation/core/routes.dart';
import 'package:movieapp/presentation/home/homepage.dart';
import 'package:movieapp/presentation/home/homepage_viewonly/homepage_viewonly.dart';

class LoginOptions extends StatefulWidget {
  final Function togglelogin;
  final Function togglesignin;
  final Function togglesignup;
  LoginOptions({
    this.togglelogin,
    this.togglesignin,
    this.togglesignup,
  });
  @override
  _LoginOptionsState createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  bool logintapped = false;
  bool signuptapped = false;
  bool skiptapped = false;

  @override
  Widget build(BuildContext context) {
    return skiptapped
        ? HomepageViewonly()
        : Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/vectors/welcomepage.png",
                      scale: 6.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Welcome to,',
                          style: GoogleFonts.comingSoon(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 20,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' CoviCare',
                              style: GoogleFonts.miniver(
                                letterSpacing: 1,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text: ' ???',
                              style: GoogleFonts.miniver(
                                letterSpacing: 1,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          logintapped = true;
                        });
                        await Future.delayed(Duration(milliseconds: 750));
                        widget.togglelogin();
                        widget.togglesignin();
                        setState(() {
                          logintapped = false;
                        });
                      },
                      child: AnimatedContainer(
                        height: 40,
                        width: logintapped ? 40 : 150,
                        duration: Duration(milliseconds: 750),
                        // color: Colors.black,
                        child: logintapped
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          signuptapped = true;
                        });
                        await Future.delayed(Duration(milliseconds: 750));
                        widget.togglelogin();
                        widget.togglesignup();
                        setState(() {
                          signuptapped = false;
                        });
                      },
                      child: AnimatedContainer(
                        height: 40,
                        width: signuptapped ? 40 : 150,
                        duration: Duration(milliseconds: 750),
                        // color: Colors.black,
                        child: signuptapped
                            ? Icon(
                                Icons.done,
                                color: Colors.black,
                              )
                            : Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Skip for now? ',
                            style: GoogleFonts.comingSoon(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: 'Skip',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  return skiptapped = true;
                                });
                              },
                            style: GoogleFonts.comingSoon(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
