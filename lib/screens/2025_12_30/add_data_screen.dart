import 'package:file_hanging_example/db_helper/db_helper.dart';
import 'package:flutter/material.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  var titleCtrl = TextEditingController();
  var subtitleCtrl = TextEditingController();

  var data = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    data = (ModalRoute.of(context)!.settings.arguments ?? []) as List;
    titleCtrl.text = data[1];
    subtitleCtrl.text = data[2];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.isEmpty? "Add Data" : "Update Data")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: InputDecoration(
                hintText: "Enter title",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: subtitleCtrl,
              decoration: InputDecoration(
                hintText: "Enter subtitle",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if(data.isEmpty){
                  DbHelper().insertData(
                    title: titleCtrl.text,
                    subtitle: subtitleCtrl.text,
                  );
                }else {
                  DbHelper().updateData(
                    id: data[0],
                    title: titleCtrl.text,
                    subtitle: subtitleCtrl.text,
                  );
                }
                Navigator.pop(context);
              },
              child: Text("Save Data"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  
                });
              },
              child: Text("Test"),
            )
          ],
        ),
      ),
    );
  }
}
