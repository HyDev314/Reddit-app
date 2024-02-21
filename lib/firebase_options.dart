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
    apiKey: 'AIzaSyDUdO2XbbOJTszRYDJNPTl4LRE9JfZzGDo',
    appId: '1:971321117925:web:2ef60024166a6fdb1a180c',
    messagingSenderId: '971321117925',
    projectId: 'reddit-clone-e8fb9',
    authDomain: 'reddit-clone-e8fb9.firebaseapp.com',
    storageBucket: 'reddit-clone-e8fb9.appspot.com',
    measurementId: 'G-G01D889X6N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEjmJjFOQb0JBmiT2HNKOPEiZWGILHEng',
    appId: '1:971321117925:android:c613f59b6937e4311a180c',
    messagingSenderId: '971321117925',
    projectId: 'reddit-clone-e8fb9',
    storageBucket: 'reddit-clone-e8fb9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUgvPDz5pIEq4ma9h-NRzydDdhx3c4de0',
    appId: '1:971321117925:ios:cdd8a9f2ffde1bf61a180c',
    messagingSenderId: '971321117925',
    projectId: 'reddit-clone-e8fb9',
    storageBucket: 'reddit-clone-e8fb9.appspot.com',
    iosBundleId: 'com.example.redditCloneMaster',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCUgvPDz5pIEq4ma9h-NRzydDdhx3c4de0',
    appId: '1:971321117925:ios:a0eb26371e1a35841a180c',
    messagingSenderId: '971321117925',
    projectId: 'reddit-clone-e8fb9',
    storageBucket: 'reddit-clone-e8fb9.appspot.com',
    iosBundleId: 'com.example.redditCloneMaster.RunnerTests',
  );
}