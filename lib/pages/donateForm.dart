import 'package:flutter/material.dart';

class DonateFormPage extends StatefulWidget {
  const DonateFormPage({super.key});

  @override
  State<DonateFormPage> createState() => _DonateFormPageState();
}

class _DonateFormPageState extends State<DonateFormPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _bloodController = TextEditingController();
  final TextEditingController _doctorController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _clinicController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dados Pessoais',
                style: TextStyle(
                    color: Color.fromRGBO(231, 53, 38, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              _textField('Nome', Icons.person, _userController),
              SizedBox(height: 10),
              _textField('Tipo Sanquíneo', Icons.water_drop, _bloodController),
              Divider(),
              Text(
                'Dados Pessoais',
                style: TextStyle(
                    color: Color.fromRGBO(231, 53, 38, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              _textField(
                  'Dr./Dra.', Icons.medical_services_outlined, _doctorController),
              SizedBox(
                height: 10,
              ),
              _textField('Rua', Icons.horizontal_distribute, _streetController),
              SizedBox(
                height: 10,
              ),
              _textField(
                  'Bairro', Icons.holiday_village_outlined, _districtController),
              SizedBox(
                height: 10,
              ),
              _textField('Numero', Icons.pin, _numberController,
                  type: TextInputType.number),
              SizedBox(
                height: 10,
              ),
              _textField('Clinica', Icons.home_work_outlined, _clinicController),
              SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(231, 53, 38, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(
      String _label, IconData _icon, TextEditingController _controller,
      {TextInputType? type, String suffix = '', bool obscureText = false}) {
    return TextField(
      controller: _controller,
      keyboardType: type,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: _label,
        labelStyle: TextStyle(color: Color.fromRGBO(116, 121, 128, 1)),
        prefixIcon: Icon(
          _icon,
          color: Color.fromRGBO(102, 112, 133, 1),
          size: 25,
        ),
        suffixIcon: Icon(
          Icons.remove_red_eye_outlined,
          color: suffix == ''
              ? Colors.transparent
              : Color.fromRGBO(102, 112, 133, 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(227, 227, 227, 1)),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(227, 227, 227, 1)),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
