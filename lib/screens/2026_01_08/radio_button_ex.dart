// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class RadioButtonEx extends StatefulWidget {
  const RadioButtonEx({super.key});

  @override
  State<RadioButtonEx> createState() => _RadioButtonExState();
}

class _RadioButtonExState extends State<RadioButtonEx> {
  var gender = "female";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Radio Screen',
        ),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              setState(() {
                gender = "male";
              });
            },
            leading: Radio(
              value: 'male',
              groupValue: gender,
              activeColor: Colors.blue,
              onChanged: (value) {},
            ),
            title: Text("Male"),
          ),
          ListTile(
            onTap: () {
              setState(() {
                gender = "female";
              });
            },
            leading: Radio(
              value: 'female',
              groupValue: gender,
              activeColor: Colors.amber,
              onChanged: (value) {},
            ),
            title: Text("Female"),
          ),
          ListTile(
            onTap: () {
              setState(() {
                gender = "other";
              });
            },
            leading: Radio(
              value: 'other',
              groupValue: gender,
              activeColor: Colors.deepOrange,
              onChanged: (value) {},
            ),
            title: Text("Prefer not to"),
          ),
        ],
      ),
    );
  }
}