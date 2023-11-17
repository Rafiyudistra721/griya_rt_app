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
    apiKey: 'AIzaSyA0-ebX3V5TBFygPutkIjZ6eP2h_2dxCWY',
    appId: '1:478872063009:web:c53b765d67fd3e3b236760',
    messagingSenderId: '478872063009',
    projectId: 'griya-rt-app',
    authDomain: 'griya-rt-app.firebaseapp.com',
    storageBucket: 'griya-rt-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvhFJu7QutrAqKkDPt4TsQRcOJOdNrrEc',
    appId: '1:478872063009:android:bc79f2b90f1c6bfe236760',
    messagingSenderId: '478872063009',
    projectId: 'griya-rt-app',
    storageBucket: 'griya-rt-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXhV7nnG04NL1QlaaTltbQgIvU-XTPQFs',
    appId: '1:478872063009:ios:7d231ccd55460f77236760',
    messagingSenderId: '478872063009',
    projectId: 'griya-rt-app',
    storageBucket: 'griya-rt-app.appspot.com',
    iosBundleId: 'com.example.griyaRtApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXhV7nnG04NL1QlaaTltbQgIvU-XTPQFs',
    appId: '1:478872063009:ios:8268107bc5f2092f236760',
    messagingSenderId: '478872063009',
    projectId: 'griya-rt-app',
    storageBucket: 'griya-rt-app.appspot.com',
    iosBundleId: 'com.example.griyaRtApp.RunnerTests',
  );
}