import 'package:flutter/material.dart';

List<Widget> getBottomButtons(active, context) {
  return [
    IconButton(
        onPressed: () {
          if (active != 'Home') {
            Navigator.pushNamed(context, '/');
          }
        },
        icon: Icon(Icons.home_filled,
            color: active == 'Home' ? const Color(0xff9C2CF3) : Colors.grey)),
    IconButton(
        onPressed: () {
          if (active != 'Tasks') {
            Navigator.pushNamed(context, '/tasks');
          }
        },
        icon: Icon(Icons.calendar_view_month,
            color: active == 'Tasks' ? const Color(0xff9C2CF3) : Colors.grey)),
    IconButton(
        onPressed: null,
        icon: Icon(Icons.notifications,
            color: active == 'Notification'
                ? const Color(0xff9C2CF3)
                : Colors.grey)),
    IconButton(
        onPressed: null,
        icon: Icon(Icons.search,
            color: active == 'Search' ? const Color(0xff9C2CF3) : Colors.grey)),
  ];
}
