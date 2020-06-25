import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/setup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.all(hp(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: hp(7),
                      ),
                      Text(
                        "Welcome back,",
                        style: (TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey)),
                      ),
                      Text(
                        "please login",
                        style: (TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey)),
                      ),
                      Text(
                        "to your account",
                        style: (TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey)),
                      ),
                      SizedBox(height: hp(7)),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration:
                                  const InputDecoration(hintText: "Email"),
                              validator: (input) {
                                if (input.isEmpty) {
                                  return "Please type an email";
                                }
                              },
                              onSaved: (input) => _email = input,
                            ),
                            SizedBox(
                              height: hp(2),
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration:
                                  const InputDecoration(hintText: "Password"),
                              validator: (input) {
                                if (input.length < 8) {
                                  return 'Password too short';
                                }
                              },
                              onSaved: (input) => _password = input,
                            ),
                            SizedBox(
                              height: hp(3),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forgot password ?",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue),
                              ),
                            ),
                            SizedBox(
                              height: hp(3),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width,
                              height: hp(7),
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                ),
                                onPressed: access,
                                color: Colors.blue,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: hp(4),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "------- OR -------",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: hp(4),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[300],
                                            offset: const Offset(2.0, 2.0),
                                            blurRadius: 5.0,
                                            spreadRadius: 5.5,
                                          ),
                                        ]),
                                    padding: EdgeInsets.all(hp(1)),
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height: hp(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Image(
                                            image: AssetImage(
                                                'assets/google.png')),
                                        Text(
                                          "Google",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[300],
                                            offset: const Offset(2.0, 2.0),
                                            blurRadius: 5.0,
                                            spreadRadius: 5.5,
                                          ),
                                        ]),
                                    padding: EdgeInsets.all(hp(1)),
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height: hp(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Image(
                                            image: AssetImage('assets/fb.png')),
                                        Text(
                                          "Facebook",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: hp(5)),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => signup()),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: "Sign Up",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ), // Container
    );
  }

  Future<void> access() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => home(user: user.user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
