import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamrin/login_screen.dart';
import 'package:tamrin/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userName;
  String? email;

  Future getUserNameAndEmail()async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
      userName = pref.getString('userName');
      email = pref.getString('email');
      setState(() {});
  }

  @override
  void initState() {
    getUserNameAndEmail();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello $userName'),
            Text('Your Email is : $finalEmail'),
            ElevatedButton(onPressed: () async{
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.remove('email');
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
