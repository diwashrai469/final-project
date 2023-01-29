import 'package:digital_map/views/login/signin%20folder/loginpage.dart';
import 'package:digital_map/views/map%20view/mappage.dart';
import 'package:digital_map/models/alert_dialog_model.dart';
import 'package:digital_map/models/custome_button_model.dart';
import 'package:digital_map/models/validity_models.dart';
import 'package:flutter/material.dart';

import '../../../models/firebase/firebase_auth.dart';
import '../../../models/textfield_model.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();
  final firebaseauthservice = firebaseauthservices();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  bool obscuretext = true;
  final validated = validity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Center(
            child: Container(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Form(
              key: _formkey,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                height: 500,
                width: 380,
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
                            "Create your account",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFieldView(
                              validator: validated.namevalidator,
                              controller: _namecontroller,
                              labeltext: "User name",
                              icon: Icon(Icons.person),
                              hintText: "User name"),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFieldView(
                              validator: validated.emailvalidator,
                              controller: _emailcontroller,
                              labeltext: "User Email",
                              icon: Icon(Icons.email),
                              hintText: "User Email"),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFieldView(
                            validator: validated.passwordvalidator,
                            controller: _passwordcontroller,
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
                                isloading: loading,
                                buttonName: "Sign Up",
                                onPressed: () async {
                                  _formkey.currentState?.save();
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    try {
                                      final usercread =
                                          await firebaseauthservice
                                              .registerUser(
                                                  email: _emailcontroller.text,
                                                  password:
                                                      _passwordcontroller.text);
                                      setState(() {
                                        loading = false;
                                      });
                                      _emailcontroller.clear();
                                      _passwordcontroller.clear();
                                      _namecontroller.clear();
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return myAlertDialog(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            mymap()),
                                                  );
                                                },
                                                text:
                                                    'Your user account has been created');
                                          });
                                    } catch (e) {
                                      setState(() {
                                        loading = false;
                                      });
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return myAlertDialog(
                                              anotherText: "Sign up",
                                              text:
                                                  "Invalid E-mail address or E-mail has already been taken.",
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            );
                                          });
                                    }
                                  }
                                },
                              )),
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
                            "Already have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                                buttonName: "Log In",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => loginpage()),
                                  );
                                },
                              )),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        )));
  }
}
