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
    apiKey: 'AIzaSyCiPoNPcHwHzGsb_UgYFh6uJihV4rprJcs',
    appId: '1:86990247944:web:66dbc0ca1ca90f8b0e59bd',
    messagingSenderId: '86990247944',
    projectId: 'medishield-ecom',
    authDomain: 'medishield-ecom.firebaseapp.com',
    storageBucket: 'medishield-ecom.appspot.com',
    measurementId: 'G-B0ZLYSCPHL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbF0Jln55nSFRE65JFsdDjBbff59tuRbE',
    appId: '1:86990247944:android:de6acbeb363d8d610e59bd',
    messagingSenderId: '86990247944',
    projectId: 'medishield-ecom',
    storageBucket: 'medishield-ecom.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCS1GxFQG-hOPDX40yf7qVJ8918YMMKm-s',
    appId: '1:86990247944:ios:fecfaaabb0add1860e59bd',
    messagingSenderId: '86990247944',
    projectId: 'medishield-ecom',
    storageBucket: 'medishield-ecom.appspot.com',
    androidClientId: '86990247944-a5j074llmqtubc5vaesubt1kavuhduuk.apps.googleusercontent.com',
    iosClientId: '86990247944-pc3l3nsgr391efp0mqdp2cjrtrf9i420.apps.googleusercontent.com',
    iosBundleId: 'com.example.medihealth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCS1GxFQG-hOPDX40yf7qVJ8918YMMKm-s',
    appId: '1:86990247944:ios:e170dad69a2f82070e59bd',
    messagingSenderId: '86990247944',
    projectId: 'medishield-ecom',
    storageBucket: 'medishield-ecom.appspot.com',
    androidClientId: '86990247944-a5j074llmqtubc5vaesubt1kavuhduuk.apps.googleusercontent.com',
    iosClientId: '86990247944-il6iggt6jk0e3b09654ca349sp07n47n.apps.googleusercontent.com',
    iosBundleId: 'com.example.medihealth.RunnerTests',
  );
}
