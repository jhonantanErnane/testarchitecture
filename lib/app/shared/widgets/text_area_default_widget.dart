import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class TextAreaDefaultWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final bool isEnable;
  final TextEditingController textCtrl;

  const TextAreaDefaultWidget({
    required this.title,
    required this.isEnable,
    required this.textCtrl,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            child: FractionallySizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 4,
                    child: Text(
                      title,
                      style: TextStyle(
                        // color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              height: screenSize.height * 0.12,
              margin: EdgeInsets.only(top: 15),
              child: SizedBox(
                  child: TextFormField(
                controller: textCtrl,
                expands: true,
                maxLines: null,
                style: TextStyle(
                  fontSize: 12,
                ),
                enabled: this.isEnable,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: hintText,
                  // hintStyle: TextStyle(color: Colors.grey.shade500),
                  filled: true,
                  fillColor:
                      this.isEnable ? AppColors.textAreaBg : Colors.black26,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ))
              // }),
              ),
        ],
      ),
    );
  }
}
