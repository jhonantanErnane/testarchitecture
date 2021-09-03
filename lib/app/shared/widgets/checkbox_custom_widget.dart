import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../models/radio_dto.dart';

class CheckBoxCustomWidget extends StatelessWidget {
  final String title;
  final List<RadioDto> items;
  final List<RadioDto> listCheckboxSelected;
  final void Function(bool, RadioDto) onChanged;

  const CheckBoxCustomWidget({
    required this.title,
    required this.items,
    required this.onChanged,
    required this.listCheckboxSelected,
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
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return Observer(builder: (_) {
              return CheckboxListTile(
                  title: Text(item.text),
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  value: listCheckboxSelected.any((element) => element == item),
                  onChanged: (bool? isSelected) =>
                      onChanged(isSelected!, item));
            });
          },
        ),
      ],
    );
  }
}
