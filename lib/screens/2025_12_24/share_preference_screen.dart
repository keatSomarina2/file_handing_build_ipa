import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefScreens extends StatefulWidget {
  const SharePrefScreens({super.key});

  @override
  State<SharePrefScreens> createState() => _SharePrefScreensState();
}

class _SharePrefScreensState extends State<SharePrefScreens> {
  void saveString() async {
    var pref = await SharedPreferences.getInstance();

    pref.setString("stringPref", "Hello from pref");
  }

  void resdString() async {
    var pref = await SharedPreferences.getInstance();

    var data = pref.getString("stringpref");

    debugPrint("data from preef : $data");
  }

  int clickIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shared Pref Screen"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topRight,
              color: Colors.amber,
              child: Bounceable(
                onTap: () { 
                  setState(() {
                    clickIndex == index;
                  });
                 },
                child: GestureDetector(
                  child: Icon(
                    Icons.bookmark_outline,
                    size: 30,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
