// ignore_for_file: must_be_immutable

import 'package:blood_bank/controllers/donate_controller.dart';
import 'package:blood_bank/data/models/Donate.dart';
import 'package:blood_bank/pages/home.dart';
import 'package:blood_bank/widgets/AppBar.dart';
import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DonationFormPage extends StatefulWidget {
  String name;
  String blood;

  DonationFormPage(this.name, this.blood, {super.key});

  @override
  State<DonationFormPage> createState() => _DonationFormPageState();
}

class _DonationFormPageState extends State<DonationFormPage> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _doctorController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _clinicController = TextEditingController();
  String dateBackup = '';

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: TopAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 28,
                      ),
                    ),
                    Text(
                      "Agendar doação",
                      style: TextStyle(
                        color: Config.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selecione a data',
                      style: TextStyle(
                          color: Config.grey2,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 170,
                      child: _inputCallender(),
                    ),
                    SizedBox(
                      height: 33,
                    )
                  ],
                ),
                _input(
                  "Nome do médico",
                  _doctorController,
                ),
                _input(
                  "Nome da clínica",
                  _clinicController,
                ),
                Text(
                  "Endereço",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 33,
                ),
                _input(
                  "Cep",
                  _cepController,
                  keyboardType: TextInputType.number,
                ),
                _input(
                  "Rua ou Avenida",
                  _streetController,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: _input(
                        "Numero",
                        _numberController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      flex: 2,
                      child: _input(
                        "Bairro",
                        _districtController,
                      ),
                    )
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          fixedSize: Size.fromHeight(52),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(
                            width: 1,
                            color: Config.greyBorder,
                          ),
                        ),
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Config.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _saveDonate();
                          }
                        },
                        style: TextButton.styleFrom(
                          fixedSize: Size.fromHeight(52),
                          backgroundColor: Config.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(
                            width: 1,
                            color: Config.greyBorder,
                          ),
                        ),
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                            color: Config.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _input(String label, TextEditingController controller,
      {IconData? icon, double? width, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Config.grey2,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            validator: Config.validator,
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: Icon(
                icon,
                color: Config.red,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 1,
                  color: Config.greyBorder,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 33,
        )
      ],
    );
  }

  Widget _inputCallender() {
    return TextFormField(
      validator: Config.validator,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2101),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Config.red, // header background color
                  onPrimary: Colors.white, // header text color
                  onSurface: Config.black, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );
        if (pickedDate != null) {
          setState(() {
            dateBackup = pickedDate.toString();
            _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
          });
        }
      },
      controller: _dateController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.calendar_month_outlined,
          color: Config.red,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Config.greyBorder,
          ),
        ),
      ),
    );
  }

  void _saveDonate() {
    Donate donate = Donate();

    donate.clinic = _clinicController.text;
    donate.date = Config.dateFormatter(dateBackup);
    donate.district = _districtController.text;
    donate.doctor = _doctorController.text;
    donate.number = _numberController.text;
    donate.status = Config.Pendente;
    donate.street = _streetController.text;
    donate.name = widget.name;
    donate.blood = widget.blood;

    print(donate);
    DonateController.internal().saveDonate(donate).then((value) {
      Navigator.pop(context);
    });
  }
}
