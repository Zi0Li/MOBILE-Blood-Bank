import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopAppBar extends StatelessWidget implements PreferredSizeWidget {

  String _name;
  String _year;
  String _blood;

  TopAppBar(String this._name, String this._year, String this._blood);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.person,
            size: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _name,
                style: TextStyle(fontSize: 20),
              ),
              Text(
               '$_year anos',
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(231, 53, 38, 1),
      actions: [
        ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.water_drop,
                color: Colors.white,
                size: 26,
              ),
              Text(
                _blood,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(231, 53, 38, 1)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}