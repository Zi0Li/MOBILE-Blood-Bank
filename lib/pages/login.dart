import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _userController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Divider(),
          _TextField()
        ],
      ),
    );
  }

  Widget _TextField(TextEditingController _Controller) {
    return TextField(
      controller: _Controller,
      decoration: InputDecoration(labelText: 'Teste'),
    );
  }
}
