import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../widgets/random_number_limit_form_field_widget.dart';

class RandomNumberGeneratorHookWidget extends HookWidget {
  RandomNumberGeneratorHookWidget({super.key});
  final _formKey = GlobalKey<FormState>();
  static final randomGenerator = Random();

  @override
  Widget build(BuildContext context) {
    final minValue = useState(0);
    final maxValue = useState(10);
    final randomNumber = useState<int?>(null);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Random Number Generator Hook Widget'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Generate a Random number between ${minValue.value} and ${maxValue.value}"),
              RandomValueLimitFormFieldWidget(
                onSaved: (value) {
                  if (value != null) {
                    minValue.value = int.tryParse(value) ?? minValue.value;
                  }
                },
                hintText: "Min value for random number",
              ),
              RandomValueLimitFormFieldWidget(
                onSaved: (value) {
                  if (value != null) {
                    maxValue.value = int.tryParse(value) ?? maxValue.value;
                  }
                },
                hintText: "Max value for random number",
              ),
              randomNumber.value != null
                  ? RandomNumberTextWidget(
                      minValue: minValue.value,
                      maxValue: maxValue.value,
                      randomNumber: randomNumber.value)
                  : Text(
                      "Click the button to generate a number",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final validation = _formKey.currentState?.validate();
          if (validation != null && validation == true) {
            _formKey.currentState!.save();
            if (maxValue.value > minValue.value) {
              randomNumber.value =
                  randomGenerator.nextInt(maxValue.value - minValue.value + 1) +
                      minValue.value;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Max value must be greater than min value.")));
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Enter valid numbers.")));
          }
        },
        tooltip: 'Generate Number',
        label: const Text("Generate number"),
      ),
    );
  }
}

class RandomNumberTextWidget extends StatelessWidget {
  const RandomNumberTextWidget({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.randomNumber,
  });

  final int minValue;
  final int maxValue;
  final int? randomNumber;

  @override
  Widget build(BuildContext context) {
    return RichText(
          textAlign: TextAlign.center,

      text: TextSpan(
        text: 'Random number generated between',
        style: Theme.of(context).textTheme.bodyLarge,
        children: <TextSpan>[
          TextSpan(
              text: ' $minValue',
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  fontStyle: FontStyle.italic)),
          const TextSpan(text: ' and'),
          TextSpan(
              text: ' $maxValue',
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  fontStyle: FontStyle.italic)),
          const TextSpan(text: ' is'),
          TextSpan(
              text: ' $randomNumber',
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
