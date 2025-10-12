import 'package:e_com_bloc/firebase_options.dart';
import 'package:e_com_bloc/view/checkout_screen/checkout/checkout.dart';
import 'package:e_com_bloc/view/checkout_screen/shipping/shipping_address.dart';
import 'package:e_com_bloc/view/home/home_screen.dart';
import 'package:e_com_bloc/view/register/sent_otp_phonenumber.dart';
import 'package:e_com_bloc/view/register/sign_in.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SignInScreen()
      // home: GetStartScreen()
      home: SignInScreen(),
      // home: ShippingAddress(),
      // home: HomeScreen(),
    );
  }
}
