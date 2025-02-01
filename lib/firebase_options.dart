// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyCX7z3gaSjrRBTOulDiCroLUnr6Vonvc3k',
    appId: '1:851778398104:web:9e3a01460ca5363875eded',
    messagingSenderId: '851778398104',
    projectId: 'simpleapp-56e20',
    authDomain: 'simpleapp-56e20.firebaseapp.com',
    storageBucket: 'simpleapp-56e20.firebasestorage.app',
    measurementId: 'G-VL1865DB8J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1DoWHFjvadSv0lS4W706vi1Kdh1JwTpo',
    appId: '1:851778398104:android:2cd3d252e720ab4975eded',
    messagingSenderId: '851778398104',
    projectId: 'simpleapp-56e20',
    storageBucket: 'simpleapp-56e20.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCu6-l7nBAJOq-mtOiGGy96ok1Uys_YLoI',
    appId: '1:851778398104:ios:4b8f087949ea651a75eded',
    messagingSenderId: '851778398104',
    projectId: 'simpleapp-56e20',
    storageBucket: 'simpleapp-56e20.firebasestorage.app',
    iosBundleId: 'com.example.simpleApp',
  );
}
