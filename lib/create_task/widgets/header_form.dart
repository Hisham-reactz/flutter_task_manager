import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Column headerForm(
  BuildContext context,
) {
  //Header form

  TextEditingController dateCtrl = TextEditingController(
    text: '',
  );
  TextEditingController titleCtrl = TextEditingController(
    text: '',
  );

  void selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.input,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2070));
    if (pickedDate != null && pickedDate != DateTime.now()) {
      dateCtrl.text = pickedDate.toString().substring(0, 10);
    }
  }

  inputDecoration(type) => InputDecoration(
        labelText: type,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 22.42.sp,
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.3,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.3,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.3,
          ),
        ),
      );

  final textStyle = TextStyle(
    color: Colors.white,
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
  );

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 515.sp,
        height: 114.sp,
        child: TextFormField(
          controller: titleCtrl,
          style: textStyle,
          decoration: inputDecoration('Title'),
          onEditingComplete: () {},
        ),
      ),
      SizedBox(
        width: 515.sp,
        height: 114.sp,
        child: TextFormField(
          controller: dateCtrl,
          readOnly: true,
          onTap: () {
            selectDate(context);
          },
          style: textStyle,
          decoration: inputDecoration('Date'),
        ),
      ),
      SizedBox(
        height: 59.sp,
      )
    ],
  );
}
