import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'random_number_generator_state_notifier.dart';
import '../widgets/random_number_limit_form_field_widget.dart';

class RandomNumberGeneratorStateNotifierWidget extends ConsumerWidget {
  RandomNumberGeneratorStateNotifierWidget({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomNumberGenerator = ref.watch(randomNumberGeneratorProvider);
    final minValue = randomNumberGenerator.minValue;
    final maxValue = randomNumberGenerator.maxValue;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Random Number Generator State Notifier'),
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
                    ref
                        .read(randomNumberGeneratorProvider.notifier)
                        .setMinValue(int.tryParse(value) ??
                            ref.read(randomNumberGeneratorProvider).minValue);
                  }
                },
                hintText: "Min value for random number",
              ),
              RandomValueLimitFormFieldWidget(
                onSaved: (value) {
                  if (value != null) {
                    ref
                        .read(randomNumberGeneratorProvider.notifier)
                        .setMaxValue(int.tryParse(value) ??
                            ref.read(randomNumberGeneratorProvider).maxValue);
                  }
                },
                hintText: "Max value for random number",
              ),
              randomNumberGenerator.randomNumber != null
                  ? const RandomNumberText()
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
            if (randomNumberGenerator.maxValue >
                randomNumberGenerator.minValue) {
              ref.read(randomNumberGeneratorProvider.notifier).setRandomValue();
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

class RandomNumberText extends ConsumerWidget {
  const RandomNumberText({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomNumberGenerator = ref.watch(randomNumberGeneratorProvider);
    final minValue = randomNumberGenerator.minValue;
    final maxValue = randomNumberGenerator.maxValue;

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
              text: ' ${randomNumberGenerator.randomNumber}',
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
