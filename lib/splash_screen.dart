import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamrin/home_screen.dart';
import 'package:tamrin/login_screen.dart';

String finalEmail = '';

class SplashScreen extends StatefulWidget {
  static String routeName = 'splash screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationData().whenComplete(() => Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,finalEmail==''? LoginScreen.routeName: HomeScreen.routeName);
    }));
    super.initState();
  }
  Future getValidationData()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var validationData = pref.getString('email');
    setState(() {
      finalEmail = validationData!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Welcome to our app'),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
