import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/infrastructure/services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  final Function togglelogin;
  final Function togglesignin;
  final Function togglesignup;
  SignUpPage({this.togglelogin, this.togglesignin, this.togglesignup});
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthServices _authServices = AuthServices();
  bool signuptapped = false;
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Center(
            child: ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      width: 20,
                    )),
                    Image.asset(
                      'assets/vectors/Login-rafiki(2)(1).png',
                      scale: 3,
                      fit: BoxFit.fill,
                    ),
                    Expanded(
                        child: SizedBox(
                      width: 20,
                    )),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        width: 350,
                        // height: MediaQuery.of(context).size.height,
                        child: TextFormField(
                          validator: (val) {
                            return val.isEmpty ? 'Name is required' : null;
                          },
                          onChanged: (val) {
                            setState(() {
                              return name = val;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'Name',
                              icon: Icon(
                                CupertinoIcons.person_circle_fill,
                                color: Colors.greenAccent[200],
                                size: 40,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: 350,
                        // height: MediaQuery.of(context).size.height,
                        child: TextFormField(
                          validator: (val) {
                            return val.isEmpty ? 'Enter valid Email id' : null;
                          },
                          onChanged: (val) {
                            setState(() {
                              return email = val;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'Email',
                              icon: Icon(
                                CupertinoIcons.envelope_circle_fill,
                                color: Colors.greenAccent[200],
                                size: 40,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: 350,
                        child: TextFormField(
                          obscureText: true,
                          validator: (val) {
                            return val.length < 6 ? 'Password is short' : null;
                          },
                          onChanged: (val) {
                            setState(() {
                              return password = val;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'Password',
                              icon: Icon(
                                CupertinoIcons.lock_circle_fill,
                                color: Colors.greenAccent[200],
                                size: 40,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            signuptapped = true;
                          });
                          await Future.delayed(Duration(milliseconds: 500));
                          if (_formkey.currentState.validate()) {
                            dynamic result =
                                await _authServices.regwithemailandpass(
                              email,
                              password,
                              name,
                            );
                            if (result == null) {
                              setState(() {
                                error = 'Enter valid email id';
                                signuptapped = false;
                              });
                            }
                          } else {
                            setState(() {
                              signuptapped = false;
                            });
                          }
                        },
                        child: AnimatedContainer(
                          height: 40,
                          width: signuptapped ? 40 : 150,
                          duration: Duration(milliseconds: 500),
                          // color: Colors.black,
                          child: signuptapped
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.greenAccent[200],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: '--------------------'),
                        TextSpan(
                          text: ' or ',
                          style: GoogleFonts.comingSoon(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(text: '----------------------'),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 25,
                // ),
                // SignInButton(
                //   Buttons.Google,
                //   onPressed: () {},
                // ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      width: 20,
                    )),
                    SignInButton(
                      Buttons.Pinterest,
                      onPressed: () {},
                      mini: true,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SignInButton(
                      Buttons.Apple,
                      onPressed: () {},
                      mini: true,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SignInButton(
                      Buttons.Twitter,
                      onPressed: () {},
                      mini: true,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SignInButton(
                      Buttons.Facebook,
                      onPressed: () {},
                      mini: true,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SignInButton(
                      Buttons.Reddit,
                      onPressed: () {},
                      mini: true,
                    ),
                    Expanded(
                        child: SizedBox(
                      width: 20,
                    )),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Already have an account? ',
                          style: GoogleFonts.comingSoon(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              widget.togglesignup();
                              widget.togglesignin();
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
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Go Back to Home page? ',
                          style: GoogleFonts.comingSoon(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Home',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              widget.togglesignup();
                              widget.togglelogin();
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
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
