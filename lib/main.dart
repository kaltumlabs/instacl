import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instacl/Responsive/Responsive.dart';
import 'package:instacl/Responsive/mobileScreenLayout.dart';
import 'package:instacl/Responsive/webScreenLayout.dart';
import 'package:instacl/Screen/Login_Screen.dart';
import 'package:instacl/Screen/Sign_Screen.dart';
import 'package:instacl/utilities/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC28czhR84FYAgtHAehSyRo8WfjhO5gjOY",
            appId: "1:322716192998:web:1ce4b07d78c845dd6feb27",
            messagingSenderId: "322716192998",
            projectId: "instacl-b5333",
        storageBucket: "instacl-b5333.appspot.com",));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const Responsive(
      //     webScreenLayout: webScreenLayout(),
      //     mobileScreenLayout: mobileScreenLayout()),
      home: const SignInScreen(),
    );
  }
}
