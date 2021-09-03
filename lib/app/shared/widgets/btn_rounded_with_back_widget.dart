import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class BtnRoundedWithBackWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool arrowIsBack;
  final bool whiteTheme;

  const BtnRoundedWithBackWidget({
    required this.text,
    required this.onTap,
    required this.arrowIsBack,
    this.whiteTheme = true,
  });

  @override
  Widget build(BuildContext context) {
    final _btnTheme = whiteTheme
        ? TextButton.styleFrom(
            primary: AppColors.primaryColor,
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          )
        : TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: AppColors.primaryColor,
            padding: EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          );
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onTap,
            child: Stack(
              children: [
                arrowIsBack
                    ? Align(
                        child: Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                        alignment: Alignment.centerLeft,
                      )
                    : Align(
                        child: Icon(
                          Icons.arrow_forward,
                          size: 25,
                        ),
                        alignment: Alignment.centerRight,
                      ),
                Center(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            style: _btnTheme,
          ),
        ),
      ],
    );
  }
}
