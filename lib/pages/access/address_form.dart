// ignore_for_file: must_be_immutable

import 'package:blood_bank/pages/access/blood_form.dart';
import 'package:blood_bank/widgets/AppBar.dart';
import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';

class AddressFormPage extends StatefulWidget {
  Map<String, dynamic> user;

  AddressFormPage({required this.user, super.key});

  @override
  State<AddressFormPage> createState() => _AddressFormPageState();
}

class _AddressFormPageState extends State<AddressFormPage> {

  String? dropdownHemo;
  String? dropdownState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.health_and_safety_outlined,
                    color: Config.red,
                    size: 38,
                  ),
                  Text(
                    "Blood Bank",
                    style: TextStyle(
                      color: Config.black,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Text(
                "Doar sangue salva vidas!",
                style: TextStyle(
                  color: Config.grey1,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Cadastrar-se",
                style: TextStyle(
                  color: Config.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(),
                  Text(
                    "Estado ",
                    style: _textStyle(),
                  ),
                  SizedBox(height: 10),
                  DropdownMenu<dynamic>(
                    width: 230,
                    initialSelection: dropdownState,
                    textStyle: _textStyle(),
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Config.greyBorder)),
                    ),
                    onSelected: (value) {
                      setState(() {
                        dropdownState = value!;
                      });
                    },
                    dropdownMenuEntries:
                        Config.states.map<DropdownMenuEntry<String>>(
                      (String value) {
                        return DropdownMenuEntry<String>(
                          value: value,
                          label: value,
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Text(
                    "Hemocentro",
                    style: _textStyle(),
                  ),
                  SizedBox(height: 10),
                  DropdownMenu<dynamic>(
                    width: 230,
                    initialSelection: dropdownHemo,
                    textStyle: _textStyle(),
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Config.greyBorder)),
                    ),
                    onSelected: (value) {
                      setState(() {
                        dropdownHemo = value!;
                      });
                    },
                    dropdownMenuEntries:
                        Config.states.map<DropdownMenuEntry<String>>(
                      (String value) {
                        return DropdownMenuEntry<String>(
                          value: value,
                          label: value,
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 52,
                child: TextButton(
                  onPressed: () {

                    widget.user['hemo'] = dropdownHemo;
                    widget.user['state'] = dropdownState;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BloodFormPage(
                          user: widget.user,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Continuar',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Config.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Config.grey1,
    );
  }
}
