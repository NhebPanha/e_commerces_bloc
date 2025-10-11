import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  String envKeyCheck;
  DefaultFirebaseOptions({required this.envKeyCheck});

  /// SIT
  static const FirebaseOptions androidSIT = FirebaseOptions(apiKey: "AIzaSyD0mvsYnyvEsJXmIYv7PUXxQtlpgEi7Yb0", appId: "1:346034652277:android:e2dc507b3d3ddd3933643c", messagingSenderId: "346034652277", projectId: "mobile-application-c87ef");

  static const FirebaseOptions iosSIT = FirebaseOptions(apiKey: "AIzaSyAU3aKulNmdc1VOHCjcunR0exme3pEed38", appId: "1:346034652277:ios:df523c0924179cd933f162", messagingSenderId: "346034652277", projectId: "mobile-application-c87ef");

  /// UAT
  static const FirebaseOptions androidUAT = FirebaseOptions(apiKey: "AIzaSyD0mvsYnyvEsJXmIYv7PUXxQtlpgEi7Yb0", appId: "1:346034652277:android:e2dc507b3d3ddd3933643c", messagingSenderId: "346034652277", projectId: "mobile-application-c87ef");

  static const FirebaseOptions iosUAT = FirebaseOptions(apiKey: "AIzaSyAU3aKulNmdc1VOHCjcunR0exme3pEed38", appId: "1:346034652277:ios:f05425592abca49933f162", messagingSenderId: "346034652277", projectId: "mobile-application-c87ef");

  /// Prod
  static const FirebaseOptions androidProd = FirebaseOptions(apiKey: "AIzaSyD0mvsYnyvEsJXmIYv7PUXxQtlpgEi7Yb0", appId: "1:346034652277:android:e2dc507b3d3ddd3933643c", messagingSenderId: "346034652277", projectId: "mobile-application-c87ef");

  static const FirebaseOptions iosProd = FirebaseOptions(apiKey: "AIzaSyAU3aKulNmdc1VOHCjcunR0exme3pEed38", appId: "1:346034652277:android:e2dc507b3d3ddd3933643c", messagingSenderId: "346034652277", projectId: "mobile-application-c87ef");

  FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        if (envKeyCheck == "sit") {
          return androidSIT;
        } else if (envKeyCheck == "uat") {
          return androidUAT;
        } else {
          return androidProd;
        }
      case TargetPlatform.iOS:
        if (envKeyCheck == "sit") {
          return iosSIT;
        } else if (envKeyCheck == "uat") {
          return iosUAT;
        } else {
          return iosProd;
        }
      default:
        throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
    }
  }
}
