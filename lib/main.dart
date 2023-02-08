import 'package:digital_map/firebase_options.dart';
import 'package:digital_map/views/login/signin%20folder/loginpage.dart';
import 'package:digital_map/views/login/signin%20folder/signinpage.dart';
import 'package:digital_map/views/lottie%20splash%20screen/lottie_anmation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/signInPage': (ctx) {
        return signin();
      },
      '/LogInPage': (ctx) {
        return loginpage();
      },
      '/lottieAnimation': (ctx) {
        return lottieAnimation();
      },
    },
    initialRoute: '/lottieAnimation',
  ));
}
