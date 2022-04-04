import 'package:flutter/material.dart';
import 'package:tamrin/home_screen.dart';
import 'package:tamrin/login_screen.dart';
import 'package:tamrin/splash_screen.dart';

void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context)=>const SplashScreen(),
        LoginScreen.routeName: (context)=> const LoginScreen(),
        HomeScreen.routeName: (context)=> const HomeScreen()
      },
    );
  }
}
