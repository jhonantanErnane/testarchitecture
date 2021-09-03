import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';

class TextFieldDefaultWidget extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isEnable;
  // final bool withTitle;
  final String title;

  const TextFieldDefaultWidget({
    required this.hintText,
    this.validator,
    this.controller,
    this.textInputType,
    this.inputFormatters,
    this.isEnable = true,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    Widget _buildTextFormField() {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enabled: isEnable,
        validator: this.validator,
        keyboardType: textInputType,
        controller: this.controller,
        inputFormatters: this.inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
        ),
      );
    }

    Widget _buildTitle() {
      return Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return title.isEmpty
        ? _buildTextFormField()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              _buildTextFormField(),
            ],
          );
  }
}
