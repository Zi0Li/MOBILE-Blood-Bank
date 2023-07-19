import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 390,
            height: 295,
            decoration: ShapeDecoration(
              color: Color.fromRGBO(231, 53, 38, 1),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100)),
              ),
            ),
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    color: Color.fromRGBO(249, 223, 223, 1)),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          _CheckBox()
        ],
      ),
    );
  }

  Widget _CheckBox() {
    return Container(
      width: 350,
      height: 80,
      decoration: BoxDecoration(
          color: Color.fromRGBO(249, 223, 223, 1),
          borderRadius: BorderRadius.circular(10),
          border: Border(
            left: BorderSide(width: 0, color: Color(0xFFE73526)),
            bottom: BorderSide(width: 4, color: Color(0xFFE73526)),
            right: BorderSide(width: 0, color: Color(0xFFE73526)),
            top: BorderSide(width: 0, color: Color(0xFFE73526)),
          ),
          boxShadow: const [
            BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 1,
                spreadRadius: 0,
                offset: Offset(0, 4))
          ]),
      child: Column(children: [Text('Teste'),]),
    );
  }
}
