import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class BtnRoundedWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool primaryTheme;
  final bool isElevatedButton;

  const BtnRoundedWidget({
    required this.text,
    required this.onTap,
    this.primaryTheme = true,
    this.isElevatedButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final _btnTheme = primaryTheme
        ? TextButton.styleFrom(
            primary: isElevatedButton ? Colors.white : AppColors.primaryColor,
            textStyle: TextStyle(
                fontWeight:
                    isElevatedButton ? FontWeight.normal : FontWeight.bold),
            backgroundColor:
                isElevatedButton ? AppColors.primaryColor : Colors.white,
            padding: EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          )
        : TextButton.styleFrom(
            primary: isElevatedButton ? Colors.white : AppColors.secondaryColor,
            textStyle: TextStyle(
                fontWeight:
                    isElevatedButton ? FontWeight.normal : FontWeight.bold),
            backgroundColor:
                isElevatedButton ? AppColors.secondaryColor : Colors.white,
            padding: EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          );
    return Row(
      children: [
        Expanded(
          child: isElevatedButton
              ? ElevatedButton(
                  onPressed: onTap,
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  style: _btnTheme,
                )
              : TextButton(
                  onPressed: onTap,
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  style: _btnTheme,
                ),
        ),
      ],
    );
  }
}
