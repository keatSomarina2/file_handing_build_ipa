// import 'package:file_hanging_example/screens/2025_12_24/new.dart';
// import 'package:file_hanging_example/screens/2025_12_25/share_preference_screen02.dart';
import 'package:file_hanging_example/screens/2025_12_26/sqlite_demo.dart';
import 'package:file_hanging_example/screens/2025_12_30/add_data_screen.dart';
import 'package:file_hanging_example/screens/2026_01_02/date_time_picker_ex.dart';
import 'package:file_hanging_example/screens/2026_01_08/radio_button_ex.dart';
import 'package:file_hanging_example/screens/2026_01_09/home_screen.dart';
import 'package:file_hanging_example/screens/2026_01_09/login_screen.dart';
import 'package:file_hanging_example/screens/2026_01_09/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      initialRoute: "/splashscreen", 
      routes:{
        "/homescreen": (context) => HomeScreen(),
        "/splashscreen": (context) => SplashScreen(),
        "/login": (context) => LoginScreen(),
        "/home": (context) => SqliteDemo(),
        "/addData": (context) => AddDataScreen(),
        "/dateTime": (context) => DateTimePickerEx(),
        "/radio": (context) => RadioButtonEx(),
      },
      debugShowCheckedModeBanner: false,
      // home: SharePreferenceScreen(),
    );
  }
}
