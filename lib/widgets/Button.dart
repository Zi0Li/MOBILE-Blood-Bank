import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Button extends StatelessWidget {
  String _text = '';
  String _image = '';

  Button(String this._text, String this._image);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  _image,
                  color: Color.fromRGBO(41, 45, 50, 1),
                  width: 55,
                  height: 55,
                ),
                SizedBox(height: 8), // Espaço entre o ícone e o texto
                Text(
                  _text,
                  style: TextStyle(color: Color.fromRGBO(41, 45, 50, 1)),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.black,
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              elevation: 5,
              fixedSize: Size(95, 95),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
