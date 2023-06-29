import 'package:flutter/material.dart';

class RandomValueLimitFormFieldWidget extends StatelessWidget {
  const RandomValueLimitFormFieldWidget(
      {super.key, required this.onSaved, required this.hintText});
  final void Function(String?) onSaved;
  final String hintText;

  String? numberValidator(String? value) {
    if (value == null || int.tryParse(value) == null) {
      return "Input a  valid number";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          decoration: InputDecoration(
              hintText: hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          validator: numberValidator,
          onSaved: onSaved,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number),
    );
  }
}
