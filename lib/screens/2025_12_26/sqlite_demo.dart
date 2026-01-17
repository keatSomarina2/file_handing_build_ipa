import 'package:file_hanging_example/db_helper/db_helper.dart';
import 'package:flutter/material.dart';

class SqliteDemo extends StatefulWidget {
  const SqliteDemo({super.key});

  @override
  State<SqliteDemo> createState() => _SqliteDemoState();
}

class _SqliteDemoState extends State<SqliteDemo> {
  var listData = [];

  void loadData() async {
    var data = await DbHelper().readData();
    setState(() {
      listData = data;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    listData[index]["title"],
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    listData[index]["subtitle"],
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          DbHelper().deleteData(listData[index]["id"]);
                          loadData();
                        },
                        icon: Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () {
                         Navigator.pushNamed(
                          context,
                          "/addData",
                          arguments: [
                            listData[index]["id"],
                            listData[index]["title"],
                            listData[index]["subtitle"],
                          ],
                         ).then((value) {
                            loadData();
                         });
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  
                );
              },
              itemCount: listData.length,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/addData").then((value) {
                  loadData();
                });
              },
              child: Text("Write to db"),
            ),
          ],
        ),
      ),
    );
  }
}
