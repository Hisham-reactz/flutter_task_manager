import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_scheduler_example/create_task/create_task_view.dart';
import 'package:flutter_scheduler_example/home/home_view.dart';
import 'package:flutter_scheduler_example/root/root_view.dart';
import 'package:flutter_scheduler_example/tasks/tasks_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
      title: 'Scheduled Notification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xffF2F5FF),
        bottomAppBarColor: const Color(0xffF2F5FF),
        dividerColor: Colors.transparent,
      ),
      home: const RootView(
        page: HomeView(),
      ),
      routes: {
        '/tasks': (c) => const RootView(
              page: TaskView(),
            ),
        '/create_task': (c) => const RootView(
              page: CreateTaskView(),
            ),
      },
    );
  }
}
