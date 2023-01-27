// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCpHzt2hRb3J6FLat0y_HRzFQtWm7YQM7E',
    appId: '1:953539257808:web:ec7ec3323813481ec2c5d5',
    messagingSenderId: '953539257808',
    projectId: 'digitalmap-ae7c4',
    authDomain: 'digitalmap-ae7c4.firebaseapp.com',
    storageBucket: 'digitalmap-ae7c4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASRGo9by7VsiyUwZhfFtsDUGiFcseIbV0',
    appId: '1:953539257808:android:0479a070e60639e4c2c5d5',
    messagingSenderId: '953539257808',
    projectId: 'digitalmap-ae7c4',
    storageBucket: 'digitalmap-ae7c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAy6JIWYWjby9fv4-ArY8thACI74XtHG34',
    appId: '1:953539257808:ios:fe3a88ea77a7ae4bc2c5d5',
    messagingSenderId: '953539257808',
    projectId: 'digitalmap-ae7c4',
    storageBucket: 'digitalmap-ae7c4.appspot.com',
    iosClientId: '953539257808-e0d795rn8hg2gg6s1brefqui9452ii0u.apps.googleusercontent.com',
    iosBundleId: 'com.example.digitalMap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAy6JIWYWjby9fv4-ArY8thACI74XtHG34',
    appId: '1:953539257808:ios:fe3a88ea77a7ae4bc2c5d5',
    messagingSenderId: '953539257808',
    projectId: 'digitalmap-ae7c4',
    storageBucket: 'digitalmap-ae7c4.appspot.com',
    iosClientId: '953539257808-e0d795rn8hg2gg6s1brefqui9452ii0u.apps.googleusercontent.com',
    iosBundleId: 'com.example.digitalMap',
  );
}
