import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'random_number_generator_get_controller.dart';
import '../widgets/random_number_limit_form_field_widget.dart';

class RandomNumberGeneratorGetControllerWidget extends StatelessWidget {
  RandomNumberGeneratorGetControllerWidget({super.key});

  final _formKey = GlobalKey<FormState>();
  final randomNumberController = Get.put(RandomNumberGeneratorGetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Random Number Generator Get Controller'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GetX<RandomNumberGeneratorGetController>(
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Generate a Random number between ${controller.minValue} and ${randomNumberController.maxValue}"),
                  );
                },
              ),
              RandomValueLimitFormFieldWidget(
                onSaved: (value) {
                  if (value != null) {
                    randomNumberController.setMinValue(
                        int.tryParse(value) ?? randomNumberController.minValue);
                  }
                },
                hintText: "Min value for random number",
              ),
              RandomValueLimitFormFieldWidget(
                onSaved: (value) {
                  if (value != null) {
                    randomNumberController.setMaxValue(
                        int.tryParse(value) ?? randomNumberController.maxValue);
                  }
                },
                hintText: "Max value for random number",
              ),
              Obx(() {
                return randomNumberController.randomNumber != null
                    ? const RandomNumberText()
                    : Text(
                        "Click the button to generate a number",
                        style: Theme.of(context).textTheme.bodyLarge,
                      );
              }),
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
            if (randomNumberController.maxValue >
                randomNumberController.minValue) {
              randomNumberController.generateRandomNumber();
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

class RandomNumberText extends GetView<RandomNumberGeneratorGetController> {
  const RandomNumberText({super.key});
  @override
  Widget build(BuildContext context) {
    // final randomNumberController =
    //     Get.find<RandomNumberGeneratorGetController>();

    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Random number generated between',
            style: Theme.of(context).textTheme.bodyLarge,
            children: <TextSpan>[
              TextSpan(
                  text: ' ${controller.minValue}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      fontStyle: FontStyle.italic)),
              const TextSpan(text: ' and'),
              TextSpan(
                  text: ' ${controller.maxValue}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      fontStyle: FontStyle.italic)),
              const TextSpan(text: ' is'),
              TextSpan(
                  text: ' ${controller.randomNumber}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                      fontStyle: FontStyle.italic)),
            ],
          ),
        ),
      );
    });
  }
}
