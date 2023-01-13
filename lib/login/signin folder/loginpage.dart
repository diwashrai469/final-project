import 'package:digital_map/login/signin%20folder/signinpage.dart';
import 'package:digital_map/mappage.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
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
                        Card(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter cannot be empty.";
                              }
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.person),
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
                            )),
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
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signin()),
                                );
                              });
                            },
                            child: const Text("SIGN UP"))
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
