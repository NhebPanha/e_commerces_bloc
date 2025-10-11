import 'package:e_com_bloc/firebase_options.dart';
import 'package:e_com_bloc/view/checkout_screen/checkout/checkout.dart';
import 'package:e_com_bloc/view/checkout_screen/shipping/shipping_address.dart';
import 'package:e_com_bloc/view/home/home_screen.dart';
import 'package:e_com_bloc/view/skip_screen/get_start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    // home: SignInScreen()
    // home: GetStartScreen(),
    home: CheckoutScreen(),
    // home: ShippingAddress(),
    // home: HomeScreen(),
    );
    
  }
}
// import 'package:e_com_bloc/view/OTP/email_auth_screen.dart';
// import 'package:e_com_bloc/view/OTP/phone_auth_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(); // ensure google-service files placed
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase OTP Example',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: HomeScreen(),
//       routes: {
//         '/phone': (_) => PhoneAuthScreen(),
//         '/email': (_) => EmailLinkAuthScreen(),
//       },
//     );
//   }
// }
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Auth: Phone & Email Link')),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ElevatedButton(onPressed: ()=>Navigator.pushNamed(context, '/phone'), child: Text('Phone (SMS OTP)')),
//             SizedBox(height: 12),
//             ElevatedButton(onPressed: ()=>Navigator.pushNamed(context, '/email'), child: Text('Email Link')),
//           ],
//         ),
//       ),
//     );
//   }
// }
