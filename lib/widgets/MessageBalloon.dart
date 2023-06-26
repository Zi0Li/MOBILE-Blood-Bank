import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageBallon extends StatelessWidget {
  String _textMessage = '';
  String _textTime = '';
  final _icon;

  MessageBallon(String this._textMessage, String this._textTime, this._icon);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 352,
            height: 68,
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border(
                left: BorderSide(color: Color(0xFFE73526)),
                top: BorderSide(width: 4, color: Color(0xFFE73526)),
                right: BorderSide(color: Color(0xFFE73526)),
                bottom: BorderSide(color: Color(0xFFE73526)),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 12, top: 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      _icon,
                      size: 45,
                      color: Color.fromRGBO(231, 53, 38, 1),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          _textMessage,
                          style: TextStyle(
                            color: Color(0xFFE73526),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          _textTime,
                          style: TextStyle(
                            color: Color(0xFFE73526),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
