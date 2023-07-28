import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsCard extends StatelessWidget {
  String _date = '';
  String _text = '';

  NewsCard(String this._date, this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(249, 223, 223, 1),
          borderRadius: BorderRadius.circular(7),
          border: Border(
              left: BorderSide(color: Color.fromRGBO(231, 53, 38, 1)),
              top:
                  BorderSide(width: 4, color: Color.fromRGBO(231, 53, 38, 1)),
              bottom: BorderSide(color: Color.fromRGBO(231, 53, 38, 1)),
              right: BorderSide(color: Color.fromRGBO(231, 53, 38, 1)))),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Noticias',
                      style: TextStyle(
                          color: Color.fromRGBO(231, 53, 38, 1),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'inter'),
                    ),
                    Text(
                      _date,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.report_outlined,
                      size: 40,
                      color: Color.fromRGBO(231, 53, 38, 1),
                    )
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.red,
            ),
            Column(
              children: [
                Text(
                  _text,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
