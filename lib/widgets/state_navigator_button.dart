import 'package:flutter/material.dart';

class StateNavigatorButton extends StatelessWidget {
  const StateNavigatorButton({
    Key? key,
    required this.text,
    required this.navigatorText,
  }) : super(key: key);
  final String text;
  final String navigatorText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, navigatorText);
        },
        child: Text(text),
      ),
    );
  }
}
