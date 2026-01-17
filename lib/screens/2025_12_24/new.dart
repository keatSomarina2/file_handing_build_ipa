import 'package:flutter/material.dart';
// 1. You need to import the package to use it.
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceScreen extends StatefulWidget {
  const SharePreferenceScreen({super.key});

  @override
  State<SharePreferenceScreen> createState() => _SharePreferenceScreenState();
}

class _SharePreferenceScreenState extends State<SharePreferenceScreen> {
  // 2. Corrected the method name from "saceString" to "saveString"
  void saveString() async {

    var pref = await SharedPreferences.getInstance();
    // Example of how to save a value
    pref.setString("stringPref", "Hello From Pref");
  }

  void readString()async{
    var pref = await SharedPreferences.getInstance();
    var data = pref.getString("stringPref");

    debugPrint("Data From Pref: $data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share Preference"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {

              },
              child: Text("Read"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

              },
              child: const Text("Write"),
            ),
          ],
        ),
      ),
    );
  }
}
