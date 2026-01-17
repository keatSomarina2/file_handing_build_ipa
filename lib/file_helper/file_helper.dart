import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

class FileHelper {

  Future<String> get getLocalPath async{
    var directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get getLocaFile async{
    var path = await getLocalPath;   //open directory
    var file = File("$path/test.txt");  // open file
    //check of file exist (like have or not)
    if(!file.existsSync()) {
      // if file don't have create file
      file.create();
    }
    return file;
  }

  void writeToFile() async{
    var file = await getLocaFile;

    file.writeAsString("hello from file\n", mode: FileMode.append);
    // return file;
  }
  Future<String> readFromFile() async{
    var file  = await getLocaFile;

    var data = await file.readAsString();
    debugPrint("Data From file: $data");
    return data;
  }
}