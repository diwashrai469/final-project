import 'package:digital_map/login/signin%20folder/loginpage.dart';
import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
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
                  "Signin",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.person),
                        ),
                        labelText: "User name"),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.email),
                        ),
                        labelText: "User Email"),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.lock),
                      ),
                      labelText: "Password",
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "SIGN UP",
                    )),
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
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => loginpage()),
                        );
                      });
                    },
                    child: const Text("LOG IN"))
              ]),
        ),
      ),
    ));
  }
}
