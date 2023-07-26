import 'package:blood_bank/controllers/requirementsController.dart';
import 'package:blood_bank/widgets/NavigationBar.dart';
import 'package:flutter/material.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  Requirements _requirement = Requirements();
  List<String> _textBasic = [];
  List<String> _textTemporary = [];
  List<String> _textDefinitive = [];

  @override
  void initState() {
    super.initState();
    _textBasic.addAll(_requirement.basic);
    _textTemporary.addAll(_requirement.temporary);
    _textDefinitive.addAll(_requirement.definitive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Guia',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(231, 53, 38, 1),
      ),
      backgroundColor: Color.fromRGBO(253, 253, 253, 1),
      bottomNavigationBar: NavigationAppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Divider(),
          _title('Básicos'),
          Divider(),
          for (int i = 0; i < _textBasic.length; i++)
            _card((i + 1), _textBasic[i]),
          Divider(),
          _title('Temporários'),
          Divider(),
          for (int i = 0; i < _textTemporary.length; i++)
            _card((i + 1), _textTemporary[i]),
          Divider(),
          _title('Definitivos'),
          Divider(),
          for (int i = 0; i < _textDefinitive.length; i++)
            _card((i + 1), _textDefinitive[i]),
        ],
      )),
    );
  }

  Widget _card(int _number, String _value) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(193, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border( 
              left: BorderSide(width: 0, color: Colors.transparent),
              right: BorderSide(width: 0, color: Colors.transparent),
              top: BorderSide(width: 0, color: Colors.transparent),
              bottom: BorderSide(width: 0, color: Colors.transparent),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    '${_number.toString()}.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _value,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String _text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Text(
          _text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
