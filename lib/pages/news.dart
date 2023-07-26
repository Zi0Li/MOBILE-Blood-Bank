import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(231, 53, 38, 1),
        title: Text(
          'Noticias',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: ListView(children: [
        _newCard(),
      ]),
    );
  }

  Widget _newCard() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(249, 223, 223, 1),
              borderRadius: BorderRadius.circular(7),
              border: Border(
                  left: BorderSide(color: Color.fromRGBO(231, 53, 38, 1)),
                  top: BorderSide(
                      width: 4, color: Color.fromRGBO(231, 53, 38, 1)),
                  bottom: BorderSide(color: Color.fromRGBO(231, 53, 38, 1)),
                  right: BorderSide(color: Color.fromRGBO(231, 53, 38, 1)))),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: const [
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
                        '21/21/21',
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
              Divider(color: Colors.red,),
              Column(
                children: [
                  Text(
                    'TESTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black87, fontSize: 16, ),
                  )
                ],
              )
            ]),
          )),
    );
  }
}
