import 'package:flutter/material.dart';
import 'package:resume_pro/src/resource/strings.dart';
import 'package:resume_pro/src/views/appwindow.dart';

class ResumeApp extends StatelessWidget {
  const ResumeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CommonString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: const  AppWindow(),
    );
  }
}
