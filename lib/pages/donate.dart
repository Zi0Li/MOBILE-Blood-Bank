import 'package:flutter/material.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastrar uma no consulta',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(children: []),
    );
  }
}
