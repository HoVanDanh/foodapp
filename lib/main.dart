import 'package:flutter/material.dart';
import 'package:foodapp/page/home.dart';
import 'package:foodapp/user/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future <void> main() async {
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    
    //  initialRoute: '/login', // Set your initial route if needed
    //   routes: {
    //     '/login':(context)=> LoginScreen(),
    //     '/home': (context) => HomeScreen(),
    //     // Add more routes as needed
    //   }
    home: HomeScreen(),
    );
  } 
}
