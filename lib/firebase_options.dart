// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwedTdNaCs5mIgiyBc3MaB6K_jLySai3Y',
    appId: '1:148946101026:android:3daf946615160ace053b7b',
    messagingSenderId: '148946101026',
    projectId: 'chat-app-f1641',
    storageBucket: 'chat-app-f1641.appspot.com',
    databaseURL: 'https://chat-app-f1641-default-rtdb.firebaseio.com/'
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgnK38cm6ie1Wr51CTFn4lDFzJ4ezgCSs',
    appId: '1:148946101026:ios:b6eaca5232255ecb053b7b',
    messagingSenderId: '148946101026',
    projectId: 'chat-app-f1641',
    databaseURL: 'https://chat-app-f1641-default-rtdb.firebaseio.com/',
    storageBucket: 'chat-app-f1641.appspot.com',
    androidClientId: '148946101026-tc1iafuauv7csoolurj0nmio17uaba4r.apps.googleusercontent.com',
    iosClientId: '148946101026-fv7n656g6apre43gvoegadhdaudaamgv.apps.googleusercontent.com',
    iosBundleId: 'com.example.chat-app',
  );
}
