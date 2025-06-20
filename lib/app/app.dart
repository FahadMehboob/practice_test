import 'package:flutter/material.dart';
import 'package:practice_test/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Practice Test",
      theme: ThemeData(),
      home: const HomeView(),
    );
  }
}
