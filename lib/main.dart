import 'package:e_com_bloc/components/button_next_page.dart';
import 'package:e_com_bloc/firebase_options.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_label.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/view/register/sent_otp_phonenumber.dart';
import 'package:e_com_bloc/view/register/sign_in.dart';
import 'package:e_com_bloc/view/register/sign_up.dart';
import 'package:e_com_bloc/view/register/verify_code.dart';
import 'package:e_com_bloc/view/skip_screen/get_start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'view/skip_screen/get_start_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    home: SignInScreen());
  }
}
