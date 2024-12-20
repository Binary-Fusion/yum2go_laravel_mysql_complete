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
    apiKey: 'AIzaSyArkLBTwWhtKSdu-xjRRmnwSQViK-0GN_U',
    appId: '1:307788788371:web:1af9d47bb4fee788469366',
    messagingSenderId: '307788788371',
    projectId: 'yum2go-new',
    authDomain: 'yum2go-new.firebaseapp.com',
    databaseURL: 'https://yum2go-new-default-rtdb.firebaseio.com',
    storageBucket: 'yum2go-new.appspot.com',
    measurementId: 'G-S8T1497SCR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLJ8MQcJRRSFxUhgoEta34Nyu2-jI0q5k',
    appId: '1:307788788371:android:ccf7124f63195955469366',
    messagingSenderId: '307788788371',
    projectId: 'yum2go-new',
    databaseURL: 'https://yum2go-new-default-rtdb.firebaseio.com',
    storageBucket: 'yum2go-new.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQveUoD4cnSvFJb5rylM1SKx9yhgCPgG0',
    appId: '1:307788788371:ios:c962acb7c4a72df0469366',
    messagingSenderId: '307788788371',
    projectId: 'yum2go-new',
    databaseURL: 'https://yum2go-new-default-rtdb.firebaseio.com',
    storageBucket: 'yum2go-new.appspot.com',
    androidClientId: '307788788371-11h0qggb1fmvurht4jg9ib0l2q0c8dif.apps.googleusercontent.com',
    iosClientId: '307788788371-4167r5dt32gguctilhd1kps2ilenorba.apps.googleusercontent.com',
    iosBundleId: 'com.yum2go.driver',
  );
}
