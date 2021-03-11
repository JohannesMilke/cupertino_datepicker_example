import 'package:cupertino_datepicker_example/utils.dart';
import 'package:cupertino_datepicker_example/widget/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatetimePickerPage extends StatefulWidget {
  @override
  _DatetimePickerPageState createState() => _DatetimePickerPageState();
}

class _DatetimePickerPageState extends State<DatetimePickerPage> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildDateTimePicker(),
              const SizedBox(height: 24),
              ButtonWidget(
                onClicked: () => Utils.showSheet(
                  context,
                  child: buildDateTimePicker(),
                  onClicked: () {
                    final value =
                        DateFormat('MM/dd/yyyy HH:mm').format(dateTime);
                    Utils.showSnackBar(context, 'Selected "$value"');

                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildDateTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: DateTime(DateTime.now().year, 2, 1),
          maximumDate: DateTime.now(),
          use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
