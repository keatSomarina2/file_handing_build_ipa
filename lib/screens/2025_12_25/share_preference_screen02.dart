import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceScreen02 extends StatefulWidget {
  const SharePreferenceScreen02({super.key});

  @override
  State<SharePreferenceScreen02> createState() => _SharePreferenceScreen02State();
}

class _SharePreferenceScreen02State extends State<SharePreferenceScreen02> {
  void saveString() async {
    var pref = await SharedPreferences.getInstance();

    pref.setString("stringPref", "Hello from pref");
  }

  void resdString() async {
    var pref = await SharedPreferences.getInstance();

    var data = pref.getString("stringpref");

    debugPrint("data from preef : $data");
  }

  // int clickIndex = 0;
  var storedIndex = <String>[];
  void toggleBookmark(int index)async{
    var pref = await SharedPreferences.getInstance();
    setState(() {
      if(storedIndex.contains('bookmark_$index')){
        storedIndex.remove('bookmark_$index');
      }else{
        storedIndex.add('bookmark_$index');
      }
    });

    pref.setStringList("bookmarkItems",storedIndex);
  }

  void loadBookmark()async{
    var pref = await SharedPreferences.getInstance();

    var data = pref.getStringList("bookmarkItems") ?? [];

    setState(() {
      storedIndex = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBookmark();
  }

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
                scaleFactor: 0.5,
                onTap: () { 
                  toggleBookmark(index);
                 },
                child: Icon(
                  storedIndex.contains('bookmark_$index')
                  ?Icons.bookmark
                  :Icons.bookmark_outline,
                  size: 30,
                ),
              ),
            );
          },
          itemCount: 30,
        )
      );
  }
}
