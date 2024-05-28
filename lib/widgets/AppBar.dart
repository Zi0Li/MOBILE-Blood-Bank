import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 0, 
      backgroundColor: Config.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0);
}