import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'contact_list_store.g.dart';

class ContactListStore = _ContactListStoreBase with _$ContactListStore;

abstract class _ContactListStoreBase with Store {
  Offset? tapPosition;

  void onTapDown(TapDownDetails details) {
    tapPosition = details.globalPosition;
  }

  RelativeRect getRelativeRect(RenderBox? overlay) {
    return RelativeRect.fromRect(
      tapPosition! & Size(40, 40), // smaller rect, the touch area
      Offset.zero & overlay!.size, // Bigger rect, the entire screen
    );
  }
}
