import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/random_number_limit_form_field_widget.dart';

class RandomNumberGeneratorStatefulWidget extends StatefulWidget {
  const RandomNumberGeneratorStatefulWidget({super.key});



  @override
  State<RandomNumberGeneratorStatefulWidget> createState() =>
      _RandomNumberGeneratorStatefulWidgetState();
}

class _RandomNumberGeneratorStatefulWidgetState
    extends State<RandomNumberGeneratorStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  int? _randomNumber = 0;
  int _minValue = 0;
  int _maxValue = 10;

  static final randomGenerator = Random();

  void _generateRandomNumber() {
    final validation = _formKey.currentState?.validate();
    if (validation != null && validation == true) {
      _formKey.currentState!.save();
      if (_maxValue > _minValue) {
        setState(() {
          _randomNumber =
              randomGenerator.nextInt(_maxValue - _minValue + 1) + _minValue;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Max value must be greater than min value.")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Enter valid numbers.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Random Number Generator StatefulWidge'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Generate a Random number between $_minValue and $_maxValue"),
              RandomValueLimitFormFieldWidget(
                onSaved: (value) {
                  if (value != null) {
                    _minValue = int.tryParse(value) ?? _minValue;
                  }
                },
                hintText: "Min value for random number",
              ),
              RandomValueLimitFormFieldWidget(
                onSaved: (value) {
                  if (value != null) {
                    _maxValue = int.tryParse(value) ?? _maxValue;
                  }
                },
                hintText: "Max value for random number",
              ),
              _randomNumber != null
                  ? RichText(
          textAlign: TextAlign.center,

                      text: TextSpan(
                        text: 'Random number generated between',
                        style: Theme.of(context).textTheme.bodyLarge,
                        // DefaultTextStyle.of(context).style.copyWith(
                        //     color: Colors.black,
                        //     fontSize: 15,
                        //     fontWeight: FontWeight.normal),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' $_minValue',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic)),
                          const TextSpan(text: ' and'),
                          TextSpan(
                              text: ' $_maxValue',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic)),
                          const TextSpan(text: ' is'),
                          TextSpan(
                              text: ' $_randomNumber',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                    )
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
        onPressed: _generateRandomNumber,
        tooltip: 'Generate Number',
        label: const Text("Generate number"),
      ),
    );
  }
}
