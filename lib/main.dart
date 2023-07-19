import 'package:blood_bank/pages/form.dart';
import 'package:blood_bank/pages/home.dart';
import 'package:blood_bank/pages/login.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BloodBank(),
  ));
}

class BloodBank extends StatefulWidget {
  const BloodBank({super.key});

  @override
  State<BloodBank> createState() => _BloodBankState();
}

class _BloodBankState extends State<BloodBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}