import 'package:blood_bank/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text('Marcelo Zioli'),
        backgroundColor: Color.fromRGBO(231, 53, 38, 1),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.water_drop, color: Colors.white,),
                Text(
                  '_text',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(231, 53, 38, 1)
            ),
          ),
        ],
      ),
      body: HomePage(),
    );
  }
}
