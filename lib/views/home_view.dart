import 'package:flutter/material.dart';
import 'package:practice_test/views/calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: CalculatorView(),
      ),
    );
  }
}
