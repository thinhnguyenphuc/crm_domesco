import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimePicker {
  static Future<DateTime> showDateTimePicker(BuildContext context,
      DateTime initialDateTime, Function() onClickFinishCallback) async {
    DateTime datePickerValue = DateTime.now();
    await showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 260.sp,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: onClickFinishCallback,
                          child: const Text(textScaleFactor: 1, "Hoàn thành"))
                    ],
                  ),
                  Container(
                    height: 200.sp,
                    child: CupertinoDatePicker(
                        use24hFormat: true,
                        maximumDate: DateTime.now(),
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: initialDateTime,
                        onDateTimeChanged: (val) {
                          datePickerValue = val;
                        }),
                  ),
                ],
              ),
            ));
    return datePickerValue;
  }
}
