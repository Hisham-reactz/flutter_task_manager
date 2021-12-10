import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox descriptionInput() {
  //Description Input

  TextEditingController discCtrl = TextEditingController(
    text: '',
  );

  return SizedBox(
    width: 512.sp,
    child: ListTile(
      isThreeLine: true,
      title: SizedBox(
        height: 40.sp,
        child: Text(
          'Description',
          style: TextStyle(
            fontSize: 22.sp,
            color: const Color(0xffBFC8E8),
          ),
        ),
      ),
      subtitle: TextFormField(
        controller: discCtrl,
        decoration: const InputDecoration.collapsed(
          hintText: '',
        ),
        minLines: 3,
        maxLines: 3,
        onEditingComplete: () {},
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
