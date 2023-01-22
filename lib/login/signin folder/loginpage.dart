import 'package:digital_map/login/signin%20folder/signinpage.dart';
import 'package:digital_map/map%20view/mappage.dart';
import 'package:flutter/material.dart';

import '../../model for widget/textfield_model.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final formkey = GlobalKey<FormState>();
  bool obscuretext = true;
  String? emailvalidator(String? email) {
    if (email == null) {
      return "Email is required";
    }
    if (email.isEmpty) {
      return "Email is empty";
    }
    if (email.contains("@") & email.contains(".")) {
      return null;
    }
  }

  String? passwordvalidator(String? password) {
    if (password == null) {
      return "Password is required";
    }
    if (password.isEmpty) {
      return "Password is empty";
    }
    if (password.length >= 6) {
      return null;
    } else {
      return "Password should be greater then 6";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("asset/signin/1.jpg"),
                fit: BoxFit.fill,
              )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldView(
                          validator: emailvalidator,
                          hintText: "User Email",
                          labeltext: "User Email",
                          icon: Icon(Icons.email)),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldView(
                        validator: passwordvalidator,
                        hintText: "Password",
                        obscuretext: obscuretext,
                        onPressedEye: () {
                          print('eye pressed');
                          setState(() {
                            obscuretext = !obscuretext;
                          });
                        },
                        labeltext: "Password",
                        icon: Icon(Icons.lock),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Colors.purpleAccent,
                              Colors.indigoAccent
                            ])),
                        child: MaterialButton(
                            onPressed: () {
                              final isvvalided =
                                  formkey.currentState!.validate();
                              if (isvvalided) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => mymap()),
                                );
                              }
                            },
                            child: const Text(
                              "LOG IN",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 2,
                        endIndent: 30,
                        indent: 30,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Colors.purpleAccent,
                              Colors.indigoAccent
                            ])),
                        child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signin()),
                              );
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
