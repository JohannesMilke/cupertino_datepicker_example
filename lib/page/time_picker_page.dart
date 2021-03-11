import 'package:cupertino_datepicker_example/utils.dart';
import 'package:cupertino_datepicker_example/widget/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerPage extends StatefulWidget {
  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    dateTime = getDateTime();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTimePicker(),
              const SizedBox(height: 24),
              ButtonWidget(
                onClicked: () => Utils.showSheet(
                  context,
                  child: buildTimePicker(),
                  onClicked: () {
                    final value = DateFormat('HH:mm').format(dateTime);
                    Utils.showSnackBar(context, 'Selected "$value"');

                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 10,
          //use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );

  DateTime getDateTime() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day, now.hour, 0);
  }
}
