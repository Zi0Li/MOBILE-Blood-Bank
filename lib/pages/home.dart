import 'package:blood_bank/widgets/Button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 253, 253, 1),
      body: Padding(
        padding: EdgeInsets.fromLTRB(26, 28, 26, 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row( children: [Button('Teste','')],
            ),
          ],
        ),
      ),
    );
  }
}
