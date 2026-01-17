import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerEx extends StatefulWidget {
  const DateTimePickerEx({super.key});

  @override
  State<DateTimePickerEx> createState() => _DateTimePickerExState();
}

class _DateTimePickerExState extends State<DateTimePickerEx> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedtime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Time Picker'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                initialDate: DateTime.now(),
              ).then((value) {
                debugPrint('Date Picked: $value');
                setState(() {
                  selectedDate = value!;
                });
              });
            },
            child: Text('Show Date Picker'),
          ),
          ElevatedButton(
            onPressed: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                initialEntryMode: TimePickerEntryMode.input,
              ).then((value) {
                  debugPrint('Time : $value');
                  setState(() {
                    selectedtime = value!;
                  });
                  selectedDate = DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedtime.hour,
                    selectedtime.minute
                  );
              });
            },
            child: Text('Show Time Picker'),
          ),
          
          Text('Selected Date : ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
          Text('Selected Date : ${DateFormat("EEEE / dd / MMMM / y").format(selectedDate)}'),
          Text('Selected Time : ${selectedtime.hour}:${selectedtime.minute}'),
          Text(
            'Selected Date: ${DateFormat("hh:mm").format(selectedDate)}',
          ),
        ],
      ),
    );
  }
}