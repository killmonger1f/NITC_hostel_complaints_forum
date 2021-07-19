import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/infrastructure/services/auth_service.dart';
import 'package:movieapp/presentation/core/routes.dart';

class SignInPage extends StatefulWidget {
  final Function togglelogin;
  final Function togglesignin;
  final Function togglesignup;
  SignInPage({this.togglelogin, this.togglesignin, this.togglesignup});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  AuthServices _authServices = AuthServices();
  bool signintapped = false;
  String email = '';
  String password = '';
  String error = '';
  final _formkey = GlobalKey<FormState>();
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
                      'assets/vectors/undraw_Mobile_login_re_9ntv.png',
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
                                color: Colors.deepPurpleAccent,
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
                                color: Colors.deepPurpleAccent,
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
                            signintapped = true;
                          });
                          await Future.delayed(Duration(milliseconds: 500));
                          if (_formkey.currentState.validate()) {
                            dynamic result = await _authServices
                                .signinwithemailandpass(email, password);
                            print('line after signin');
                            if (result == null) {
                              setState(() {
                                error = 'Enter valid email id and password';
                                signintapped = false;
                              });
                            }
                          } else {
                            setState(() {
                              signintapped = false;
                            });
                          }
                        },
                        child: AnimatedContainer(
                          height: 40,
                          width: signintapped ? 40 : 150,
                          duration: Duration(milliseconds: 500),
                          // color: Colors.black,
                          child: signintapped
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  'Sign in',
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
                            color: Colors.deepPurpleAccent,
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
                          text: 'Don\'t have an account? ',
                          style: GoogleFonts.comingSoon(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              widget.togglesignin();
                              widget.togglesignup();
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
                      children: <TextSpan>[
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
                              widget.togglesignin();
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
