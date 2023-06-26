import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NextConsultation extends StatelessWidget {
  String _Street = '';
  String _District = '';
  String _Clinic = '';
  String _Number = '';
  String _Date = '';

  NextConsultation(
    this._Date,
    this._Street,
    this._Number,
    this._District,
    this._Clinic,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 147,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color(0x3F000000),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 4))
          ]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Stack(children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Próxima Consulta',
                    style: TextStyle(
                        color: Color(0xFFE73526),
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Data: $_Date',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                width: 352,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFD0D0D0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                children: [
                  Text(
                    'Rua: $_Street',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Bairro: $_District',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Clínica: $_Clinic',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  )
                ],
              )
            ],
          ),
          Column(
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 50,
                    color: Color(0xFFE73526),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'N°: $_Number',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Mapa',
                      style: TextStyle(fontSize: 16, fontFamily: 'Inter'),
                    ),
                  )
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
