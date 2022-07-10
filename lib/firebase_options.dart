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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBM_AofPZCQ7IehVPT8NqcG3Ye2bn3igL4',
    appId: '1:496559591393:web:c009747a8bbf5aebd2cca0',
    messagingSenderId: '496559591393',
    projectId: 'chat-app-555f1',
    authDomain: 'chat-app-555f1.firebaseapp.com',
    storageBucket: 'chat-app-555f1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJUOWKDduP1y3w5o1rjHtM-yQAVoc9mVw',
    appId: '1:496559591393:android:049ec35a6b1c2489d2cca0',
    messagingSenderId: '496559591393',
    projectId: 'chat-app-555f1',
    storageBucket: 'chat-app-555f1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqOBuTuY7nJmdZFCcjFFn4KC399gNW3m8',
    appId: '1:496559591393:ios:8a813cba73664210d2cca0',
    messagingSenderId: '496559591393',
    projectId: 'chat-app-555f1',
    storageBucket: 'chat-app-555f1.appspot.com',
    iosClientId: '496559591393-med60t64j0llmjnhqipuvkuk6up6b82u.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}