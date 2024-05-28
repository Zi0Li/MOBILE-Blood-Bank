import 'package:blood_bank/controllers/user_controller.dart';
import 'package:blood_bank/pages/welcome.dart';
// import 'package:blood_bank/pages/access/user_form.dart';
import 'package:blood_bank/pages/home.dart';
import 'package:flutter/material.dart';
// import 'package:blood_bank/widgets/AppBar.dart';
// import 'package:blood_bank/pages/access/blood_form.dart';
// import 'package:blood_bank/pages/historic.dart';
// import 'package:blood_bank/widgets/config.dart';
// import 'package:flutter/services.dart';
// import 'package:blood_bank/pages/access/address_form.dart';

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
  var user;
  Widget? page;

  @override
  void initState() {
    super.initState();
    _getUser().then((value) {
      setState(() {
        if (user == null) {
          page = WelcomePage();
        } else {
          page = HomePage();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page,
    );
  }

  _getUser() async {
    await UserController.internal().getUser().then((value) {
      user = value;
    });
  }
}
