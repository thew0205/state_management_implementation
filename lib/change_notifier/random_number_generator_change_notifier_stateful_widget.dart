import 'package:flutter/material.dart';

import 'random_number_generator_change_notifier.dart';
import '../widgets/random_number_limit_form_field_widget.dart';

class RandomNumberGeneratorChangeNotifierStatefulWidget extends StatefulWidget {
  const RandomNumberGeneratorChangeNotifierStatefulWidget(
      {super.key});

  @override
  State<RandomNumberGeneratorChangeNotifierStatefulWidget> createState() =>
      _RandomNumberGeneratorChangeNotifierStatefulWidgetState();
}

class _RandomNumberGeneratorChangeNotifierStatefulWidgetState
    extends State<RandomNumberGeneratorChangeNotifierStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  final _randomNumberNotifier = RandomNumberGeneratorChangerNotifier();

  @override
  void initState() {
    super.initState();
    _randomNumberNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _randomNumberNotifier.dispose();
    super.dispose();
  }

  void _generateRandomNumber() {
    final validation = _formKey.currentState?.validate();
    if (validation != null && validation == true) {
      _formKey.currentState!.save();
      if (_randomNumberNotifier.maxValue > _randomNumberNotifier.minValue) {
        _randomNumberNotifier.generateRandomNumber();
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
    final minValue = _randomNumberNotifier.minValue;
    final maxValue = _randomNumberNotifier.maxValue;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text( 'Random Number Generator Change Notifier StatefulWidget'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Generate a Random number between $minValue and $maxValue"),
              RandomValueLimitFormFieldWidget(
                onSaved: (value) {
                  if (value != null) {
                    _randomNumberNotifier.minValue =
                        int.tryParse(value) ?? minValue;
                  }
                },
                hintText: "Min value for random number",
              ),
              RandomValueLimitFormFieldWidget(
                onSaved: (value) {
                  if (value != null) {
                    _randomNumberNotifier.maxValue =
                        int.tryParse(value) ?? maxValue;
                  }
                },
                hintText: "Max value for random number",
              ),
              _randomNumberNotifier.randomNumber != null
                  ? RandomNumberText(
                      minValue: minValue,
                      maxValue: maxValue,
                      randomNumberNotifier: _randomNumberNotifier.randomNumber)
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

class RandomNumberText extends StatelessWidget {
  const RandomNumberText({
    super.key,
    required this.minValue,
    required this.maxValue,
    this.randomNumberNotifier,
  });

  final int minValue;
  final int maxValue;
  final int? randomNumberNotifier;

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
              text: ' $randomNumberNotifier',
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
