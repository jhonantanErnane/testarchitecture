import 'package:flutter/material.dart';

class DropDownDefaultWidget<T> extends StatelessWidget {
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final String hintText;

  const DropDownDefaultWidget({
    required this.validator,
    required this.onChanged,
    required this.items,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      hint: Text(this.hintText),
      icon: Icon(Icons.keyboard_arrow_down),
      iconSize: 36,
      onChanged: this.onChanged,
      validator: this.validator,
      items: this.items,
    );
  }
}
