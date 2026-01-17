import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void login() async {
    var pref = await SharedPreferences.getInstance();
    pref.setBool("isLogin", true);
  Navigator.pushNamed(context, "/homescreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2c665e),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Hero(
                tag: "logoHero",
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}