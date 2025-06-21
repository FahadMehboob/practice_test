import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  late AppLifecycleListener _listener;
  num x = 0, y = 0, z = 0;
  TextEditingController displayOne = TextEditingController();
  TextEditingController displayTwo = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listener = AppLifecycleListener(
      onShow: _onShow,
      onResume: _onResume,
      onInactive: _onInactive,
      onHide: _onHide,
      onPause: _onPause,
      onRestart: _onRestart,
      onDetach: _onDetach,
      onStateChange: _onStateChange,
    );
  }

  void _onShow() {
    print("On Show Called");
  }

  void _onHide() {
    print("On Hide Called");
  }

  void _onResume() {
    print("On Resume Called");
  }

  void _onPause() {
    print("On Pause Called");
  }

  void _onDetach() {
    print("On Detach Called");
  }

  void _onInactive() {
    print("On Inactive Called");
  }

  void _onRestart() {
    print("on Restart Called");
  }

  void _onStateChange(AppLifecycleState state) {
    print("on State Called $state");
  }

  @override
  void dispose() {
    super.dispose();

    displayOne.dispose();
    displayTwo.dispose();
    _listener.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          //display

          DisplayOne(
            key: Key("displayOne"),
            controller: displayOne,
            hint: "Enter first number",
          ),
          const SizedBox(
            height: 20,
          ),
          DisplayOne(
            key: Key("displayTwo"),
            controller: displayTwo,
            hint: "Enter second number",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            key: Key("result"),
            z.toString(),
            style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black45),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.black,
                child: const Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    z = int.parse(displayOne.value.text) +
                        int.parse(displayTwo.value.text);
                  });
                },
              ),
              FloatingActionButton(
                backgroundColor: Colors.black,
                child: const Icon(
                  CupertinoIcons.minus,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    z = int.parse(displayOne.value.text) -
                        int.parse(displayTwo.value.text);
                  });
                },
              ),
              FloatingActionButton(
                backgroundColor: Colors.black,
                child: const Icon(
                  CupertinoIcons.multiply,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    z = int.parse(displayOne.value.text) *
                        int.parse(displayTwo.value.text);
                  });
                },
              ),
              FloatingActionButton(
                backgroundColor: Colors.black,
                child: const Icon(
                  CupertinoIcons.divide,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    z = int.parse(displayOne.value.text) /
                        int.parse(displayTwo.value.text);
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
            extendedPadding: const EdgeInsets.all(80),
            backgroundColor: Colors.black,
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayOne.clear();
                displayTwo.clear();
              });
            },
            label: const Text(
              "Clear",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
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
    required this.controller,
  });

  final String? hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
