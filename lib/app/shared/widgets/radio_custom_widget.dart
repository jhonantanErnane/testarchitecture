import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/radio_dto.dart';

class RadioCustomWidget extends StatelessWidget {
  final String title;
  final List<RadioDto> items;
  final String? selectedId;
  final void Function(RadioDto?) onChanged;
  final String subTitle;

  const RadioCustomWidget({
    required this.title,
    required this.items,
    required this.selectedId,
    required this.onChanged,
    this.subTitle = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subTitle.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.secondaryColor,
                  ),
                ),
              )
            : Container(),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            // return Observer(builder: (_) {
            // return Row(
            //   children: [
            //     Radio(
            //       value: item,
            //       groupValue: controller.previousComorbidity,
            //       onChanged: controller.changePreviousComorbidity,

            //     ),
            //     Text(item.name)
            //   ],
            // );
            return RadioListTile<RadioDto>(
              value: item,
              contentPadding: EdgeInsets.zero,
              title: Text(item.text),
              groupValue:
                  items.firstWhereOrNull((element) => element.id == selectedId),
              onChanged: onChanged,
            );
            // });
          },
        ),
      ],
    );
  }
}
