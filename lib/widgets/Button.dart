import 'dart:ui';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  String _text = '';
  String _image = '';

  Button(String this._text,String this._image);

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
                Icon(
                  Icons.wifi_find,
                  color: Color.fromRGBO(41, 45, 50, 1),
                  size: 55,
                ), // Ícone exibido no centro
                SizedBox(height: 8), // Espaço entre o ícone e o texto
                Text(_text, style: TextStyle(color: Color.fromRGBO(41, 45, 50, 1)),), // Texto exibido abaixo do ícone
              ],
            ),
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.black,
              elevation: 5,
              fixedSize: Size(95, 95),
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
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
