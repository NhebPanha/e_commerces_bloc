import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
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
        return windows;
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
    apiKey: 'AIzaSyApDaGpdm9JdZ357c8n23uP9qEkUQpgks8',
    appId: '1:914928348091:web:2d96a3f3a8af3290ce729e',
    messagingSenderId: '914928348091',
    projectId: 'loginlogout-50b1a',
    authDomain: 'loginlogout-50b1a.firebaseapp.com',
    storageBucket: 'loginlogout-50b1a.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwC0BKU24idBxIjhB3AXxPNMmp5Yo41OU',
    appId: '1:691348472866:android:b43634b891416f9c37767b',
    messagingSenderId: '691348472866',
    projectId: 'e-com-app-503af',
    storageBucket: 'e-com-app-503af.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBB8z9dfbiBYqlHpCb20zLdAE2rwkDOGdI',
    appId: '1:691348472866:ios:8cf26d7827f040ee37767b',
    messagingSenderId: '691348472866',
    projectId: 'e-com-app-503af',
    storageBucket: 'e-com-app-503af.firebasestorage.app',
    iosClientId: '691348472866-kdo2tqc5k6k3p2fi5n98v2sjpho4at0r.apps.googleusercontent.com',
    iosBundleId: 'com.example.eComBloc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBpLnjsBXmz7Mmt8_TNsm4zQXC1CrE_HL0',
    appId: '1:914928348091:ios:94d5148773c50e3bce729e',
    messagingSenderId: '914928348091',
    projectId: 'loginlogout-50b1a',
    storageBucket: 'loginlogout-50b1a.firebasestorage.app',
    iosBundleId: 'com.example.eComBloc',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyApDaGpdm9JdZ357c8n23uP9qEkUQpgks8',
    appId: '1:914928348091:web:a518ad7285ea4157ce729e',
    messagingSenderId: '914928348091',
    projectId: 'loginlogout-50b1a',
    authDomain: 'loginlogout-50b1a.firebaseapp.com',
    storageBucket: 'loginlogout-50b1a.firebasestorage.app',
  );

}