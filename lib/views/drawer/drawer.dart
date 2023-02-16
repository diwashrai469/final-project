import 'package:digital_map/models/firebase/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({super.key});

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  final userData = firebaseauthservices().firebasauthInstance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
        child: Drawer(
          backgroundColor: Colors.grey.shade300,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: const [
                  Center(
                    child: CircleAvatar(
                      radius: 61,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg")),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: -80,
                      bottom: 0,
                      child: CircleAvatar(
                        child: Icon(Icons.add),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Email :' + userData.email.toString(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          colors: [Colors.purpleAccent, Colors.indigoAccent])),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        // FirebaseAuth.instance.signOut();
                        Navigator.pushNamedAndRemoveUntil(context, '/LogInPage',
                            (route) {
                          return false;
                        });
                      });
                    },
                    child: const Text(
                      "Log Out",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
