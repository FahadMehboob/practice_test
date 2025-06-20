import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          //display

          DisplayOne(
            hint: "Enter first number",
          ),
          SizedBox(
            height: 20,
          ),
          DisplayOne(
            hint: "Enter second number",
          ),
        ],
      ),
    );
  }
}

class DisplayOne extends StatelessWidget {
  const DisplayOne({
    super.key,
    required this.hint,
  });

  final String? hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 2, color: Colors.black)),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
