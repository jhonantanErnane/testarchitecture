import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool withIcon;
  final bool isWhiteTheme;
  final bool isLogged;
  final void Function()? onPressedIconProfile;

  const CustomAppBarWidget({
    required this.title,
    this.withIcon = false,
    this.isWhiteTheme = true,
    this.isLogged = false,
    this.onPressedIconProfile,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> listItems = [];
    if (withIcon) {
      listItems.addAll([
        Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: Icon(
              Icons.flutter_dash,
            )),
        SizedBox(
          width: 10,
        )
      ]);
    }
    listItems.add(
      Flexible(
        fit: FlexFit.tight,
        flex: 7,
        child: Text(
          title,
          style: TextStyle(
            color: isWhiteTheme ? AppColors.primaryColor : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    return AppBar(
      backgroundColor: isWhiteTheme ? Colors.white : AppColors.primaryColor,
      iconTheme: IconThemeData(
          color: isWhiteTheme ? AppColors.primaryColor : Colors.white),
      title: Row(
        children: listItems,
      ),
      actions: this.isLogged
          ? [
              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: onPressedIconProfile,
              ),
            ]
          : null,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
