import 'dart:io';

import 'package:digital_map/views/login/signin%20folder/signinpage.dart';
import 'package:digital_map/views/map%20view/mappage.dart';
import 'package:digital_map/models/custome_button_model.dart';
import 'package:digital_map/models/firebase/firebase_auth.dart';
import 'package:digital_map/models/fluttertoast_model.dart';
import 'package:digital_map/models/validity_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/textfield_model.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final formkey = GlobalKey<FormState>();
  bool obscuretext = true;
  bool loading = false;
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  final validators = validity();
  final firebaseauthservice = firebaseauthservices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("asset/signin/1.jpg"),
                fit: BoxFit.fill,
              )),
              child: Form(
                key: formkey,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  height: 400,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFieldView(
                              controller: _emailcontroller,
                              validator: validators.emailvalidator,
                              hintText: "User Email",
                              labeltext: "User Email",
                              icon: const Icon(Icons.email)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFieldView(
                            controller: _passwordcontroller,
                            validator: validators.passwordvalidator,
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
                          const SizedBox(
                            height: 10,
                          ),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(colors: [
                                    Colors.purpleAccent,
                                    Colors.indigoAccent
                                  ])),
                              child: CustomeButton(
                                  onPressed: () async {
                                    //check the validity of textfield
                                    final isvvalided =
                                        formkey.currentState!.validate();

                                    if (isvvalided) {
                                      setState(() {
                                        loading = true;
                                      });
                                      try {
                                        //for authorizing valid user and catching exception
                                        final credential =
                                            await firebaseauthservice
                                                .siginUser(
                                                    email:
                                                        _emailcontroller.text,
                                                    password:
                                                        _passwordcontroller
                                                            .text)
                                                .then((value) {
                                          setState(() {
                                            loading = false;
                                          });
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      mymap()));
                                        });
                                      } on FirebaseAuthException catch (e) {
                                        setState(() {
                                          loading = false;
                                        });
                                        if (e.code == 'user-not-found') {
                                          utils().toastMessage(
                                              " No user found for that email. ");
                                        } else if (e.code == 'wrong-password') {
                                          utils().toastMessage(
                                              'Wrong password provided for that user.');
                                        }
                                      }
                                    }
                                  },
                                  isloading: loading,
                                  buttonName: "LOG IN")),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            color: Colors.black,
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
                                color: Colors.black,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(colors: [
                                    Colors.purpleAccent,
                                    Colors.indigoAccent
                                  ])),
                              child: CustomeButton(
                                buttonName: "Create account",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signin()),
                                  );
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
