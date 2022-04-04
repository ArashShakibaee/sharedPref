import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tamrin/custom_text_filed.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamrin/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = 'login screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final userNameValidator = MultiValidator([
  RequiredValidator(errorText: 'userName is required'),
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'email is required'),
    PatternValidator(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+", errorText: 'email must be valid'),
  ]);
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100,),
                CustomTextField(
                  validator: userNameValidator,
                    isButton: false,
                    icon: Icons.person,
                    controller: userNameController,
                    hintText: 'Input your username',
                    obscureText: false,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  validator: emailValidator,
                    isButton: false,
                    icon: Icons.mail,
                    controller: emailController,
                    hintText: 'Input your email address',
                    obscureText: false),
                const SizedBox(height: 20),
                CustomTextField(
                  validator: passwordValidator,
                    isButton: true,
                    onPressedIconButton: ()=>setState(()=>obscureText = !obscureText),
                    iconButton: obscureText ? Icons.lock : Icons.lock_open,
                    controller: passwordController,
                    hintText: 'Input your password',
                    obscureText: obscureText),
                const SizedBox(height: 70),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () async{
                          final form = _formKey.currentState!;
                          if(form.validate()){
                            await setUserNameAndEmail();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                          }
                        },
                        child: const Text('Login')))
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future setUserNameAndEmail()async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
    pref.setString('userName', userNameController.text);
    pref.setString('email', emailController.text);
  }
}
