import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_scheduler_example/create_task/widgets/category_input.dart';
import 'package:flutter_scheduler_example/create_task/widgets/create_task_appbar.dart';
import 'package:flutter_scheduler_example/create_task/widgets/description_input.dart';
import 'package:flutter_scheduler_example/create_task/widgets/time_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateTaskView extends ConsumerWidget {
  const CreateTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    //Local widgets

    final divider = SizedBox(
      width: 512.sp,
      height: 32.sp,
      child: const Divider(
        color: Color(0xffBFC8E8),
      ),
    );

    final createButton = ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(507.sp, 92.sp),
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff3A49F9),
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        'Create Task',
        style: TextStyle(
          fontSize: 24.sp,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: createButton,
      appBar: createTaskAppbar(
        context,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 42.sp,
            ),
            timeWidget(context),
            divider,
            descriptionInput(),
            divider,
            categoryInput(context, ref),
          ],
        ),
      ),
    );
  }
}
