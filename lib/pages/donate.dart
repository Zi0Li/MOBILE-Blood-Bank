import 'package:flutter/material.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(231, 53, 38, 1),
        title: Text(
          'Cadastrar uma nova consulta',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [_card()]),
      ),
    );
  }

  Widget _TextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          label: Text(
            'Nome',
            style: TextStyle(
                color: Color.fromRGBO(231, 53, 38, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: Color.fromRGBO(231, 53, 38, 1)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: Color.fromRGBO(231, 53, 38, 1)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      decoration:
          BoxDecoration(boxShadow: const [BoxShadow(color: Colors.black)]),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
          child: Row(
            children: const [
              Icon(
                Icons.person,
                color: Color.fromRGBO(231, 53, 38, 1),
                size: 28,
              ),
              Text(
                'Dados Pessoais',
                style: TextStyle(
                    color: Color.fromRGBO(231, 53, 38, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        _TextField()
      ]),
    );
  }
}
