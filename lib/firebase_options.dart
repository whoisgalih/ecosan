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
    apiKey: 'AIzaSyAUgHoiMLfHCBrtmwGHfOxGG1Nj2m-QNOs',
    appId: '1:185090618714:web:5a7d860e104de320522f63',
    messagingSenderId: '185090618714',
    projectId: 'ecosan-fe259',
    authDomain: 'ecosan-fe259.firebaseapp.com',
    storageBucket: 'ecosan-fe259.appspot.com',
    measurementId: 'G-N1NPVN7N3T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLUIvdkOXRf1GWQ3DVVro-fFPe0kujt_I',
    appId: '1:185090618714:android:ff2ccc3193e92ea3522f63',
    messagingSenderId: '185090618714',
    projectId: 'ecosan-fe259',
    storageBucket: 'ecosan-fe259.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxQhXtuamw3D7q1sE5b5uX6z9NZYtnYy0',
    appId: '1:185090618714:ios:8a2c88e495e0bb22522f63',
    messagingSenderId: '185090618714',
    projectId: 'ecosan-fe259',
    storageBucket: 'ecosan-fe259.appspot.com',
    iosClientId: '185090618714-hj9p2dghrknjvbc8i7gfkg3jh50rejic.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecosan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxQhXtuamw3D7q1sE5b5uX6z9NZYtnYy0',
    appId: '1:185090618714:ios:23afe1dfede3d108522f63',
    messagingSenderId: '185090618714',
    projectId: 'ecosan-fe259',
    storageBucket: 'ecosan-fe259.appspot.com',
    iosClientId: '185090618714-rb66di8o05ksca9uvalcvrgoj44455k5.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecosan.RunnerTests',
  );
}