// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  void checkLogin() async {
    var pref = await SharedPreferences.getInstance();

    var isLogin = pref.getBool("isLogin") ?? false;

    if (isLogin) {
      Navigator.pushNamed(context, "/homescreen");
    }
    else {
      Navigator.pushNamed(context, "/login");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3), () {
        checkLogin();
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2c665e),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgound.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Hero(
            tag: "logoHero",
            child: Image.asset(
              "assets/images/logo.png",
              width: 90,
              height: 90,
              color: Colors.white,

            ),
          ),
        ),
      ),
    );
  }

  
}