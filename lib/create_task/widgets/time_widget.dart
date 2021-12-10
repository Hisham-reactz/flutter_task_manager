import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Row timeWidget(
  context,
) {
  ///Time selector input

  TimeOfDay _timeFrom = TimeOfDay.fromDateTime(DateTime.now());
  TimeOfDay _timeTo = TimeOfDay.fromDateTime(
    DateTime.now().add(
      const Duration(
        hours: 1,
      ),
    ),
  );

  TextEditingController timeFromCtrl = TextEditingController(
    text: _timeFrom.format(context),
  );
  TextEditingController timeToCtrl = TextEditingController(
    text: _timeTo.format(context),
  );

  void selTime(BuildContext context, time) async {
    final initTime = time ? _timeTo : _timeFrom;
    final pickedTime = await showTimePicker(
      helpText: time ? 'End Time' : 'Start TIme',
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: initTime,
    );
    if (pickedTime != null && pickedTime != initTime) {
      if (time) {
        bool invalid = (pickedTime.hour - _timeFrom.hour).isNegative;
        !invalid ? _timeTo = pickedTime : '';
        timeToCtrl.text = _timeTo.format(context);
      } else {
        bool invalid = (pickedTime.hour - _timeTo.hour).isNegative;
        invalid ? _timeFrom = pickedTime : '';
        timeFromCtrl.text = _timeFrom.format(context);
      }
    }
  }

  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    SizedBox(
      width: 190.sp,
      child: ListTile(
        onTap: () => selTime(context, false),
        title: SizedBox(
          height: 30.sp,
          child: Text(
            'Start Time',
            style: TextStyle(
              fontSize: 22.sp,
              color: const Color(0xffBFC8E8),
            ),
          ),
        ),
        subtitle: TextFormField(
          readOnly: true,
          controller: timeFromCtrl,
          decoration: const InputDecoration.collapsed(
            hintText: '',
          ),
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    SizedBox(
      width: 132.sp,
    ),
    SizedBox(
      width: 190.sp,
      child: ListTile(
        onTap: () => selTime(context, true),
        title: SizedBox(
          height: 30.sp,
          child: Text(
            'End Time',
            style: TextStyle(
              fontSize: 22.sp,
              color: const Color(0xffBFC8E8),
            ),
          ),
        ),
        subtitle: TextFormField(
          readOnly: true,
          controller: timeToCtrl,
          decoration: const InputDecoration.collapsed(
            hintText: '',
          ),
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    )
  ]);
}
