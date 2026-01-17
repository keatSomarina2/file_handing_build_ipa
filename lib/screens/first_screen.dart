import 'package:file_hanging_example/file_helper/file_helper.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String data = "";

  void loadData() async {
    var dataFromFile = await FileHelper().readFromFile();
    setState(() {
      data = dataFromFile;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: .center,
          // mainAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () {
                FileHelper().writeToFile();
              }, 
              child: Text("Write")),
            ElevatedButton(
              onPressed: () async{
                

              }, 
              child: Text("read")),
          ],
        ),
      ),
    );
  }
}
