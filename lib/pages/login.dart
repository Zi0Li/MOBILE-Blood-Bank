import 'package:blood_bank/pages/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 400,
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
              height: 90,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                      width: 300,
                      child: Text(
                        'Apelido',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  _TextField(_surnameController),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 300,
                      child: Text(
                        'E-mail',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  _TextField(_emailController),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 300,
                      child: Text(
                        'Telefone',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 7,
                  ),
                  _TextField(_phoneController),
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Próximo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(231, 53, 38, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            )
          ],
        ),
      ),
    );
  }

  Widget _TextField(TextEditingController _Controller) {
    return Container(
      width: 300,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(color: Color(0xFFE73526)),
          bottom: BorderSide(width: 4, color: Color(0xFFE73526)),
          right: BorderSide(color: Color(0xFFE73526)),
          top: BorderSide(color: Color(0xFFE73526)),
        ),
      ),
      child: Center(
        child: TextField(
          controller: _Controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}
