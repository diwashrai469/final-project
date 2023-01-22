import 'package:digital_map/login/signin%20folder/loginpage.dart';
import 'package:flutter/material.dart';

import '../../model for widget/textfield_model.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  bool obscuretext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldView(
                    labeltext: "User name",
                    icon: Icon(Icons.person),
                    hintText: "User name"),
                const SizedBox(
                  height: 5,
                ),
                TextFieldView(
                    labeltext: "User Email",
                    icon: Icon(Icons.email),
                    hintText: "User Email"),
                const SizedBox(
                  height: 5,
                ),
                TextFieldView(
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
                      gradient: LinearGradient(
                          colors: [Colors.purpleAccent, Colors.indigoAccent])),
                  child: MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 2,
                  endIndent: 30,
                  indent: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [Colors.purpleAccent, Colors.indigoAccent])),
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => loginpage()),
                        );
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ]),
        ),
      ),
    ));
  }
}
