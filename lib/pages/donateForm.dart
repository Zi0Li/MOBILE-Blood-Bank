import 'package:blood_bank/controllers/donateController.dart';
import 'package:blood_bank/controllers/formsValidator.dart';
import 'package:flutter/material.dart';

class DonateFormPage extends StatefulWidget {
  const DonateFormPage({super.key});

  @override
  State<DonateFormPage> createState() => _DonateFormPageState();
}

class _DonateFormPageState extends State<DonateFormPage> {
  DonateController controller = DonateController();
  FormsValidator validator = FormsValidator();
  Donate newDonate = Donate();

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _bloodController = TextEditingController();
  final TextEditingController _doctorController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _clinicController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String? _userError;
  String? _bloodError;
  String? _doctorError;
  String? _streetError;
  String? _districtError;
  String? _numberError;
  String? _clinicError;
  String? _dateError;

  @override
  void initState() {
    super.initState();
  }

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
              _textField('Nome', Icons.person, _userController,
                  error: _userError),
              SizedBox(height: 10),
              _textField('Tipo Sanquíneo', Icons.water_drop, _bloodController,
                  error: _bloodError),
              Divider(),
              Text(
                'Dados Pessoais',
                style: TextStyle(
                    color: Color.fromRGBO(231, 53, 38, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              _textField('Dr./Dra.', Icons.medical_services_outlined,
                  _doctorController,
                  error: _doctorError),
              SizedBox(
                height: 10,
              ),
              _textField('Rua', Icons.horizontal_distribute, _streetController,
                  error: _streetError),
              SizedBox(
                height: 10,
              ),
              _textField(
                  'Bairro', Icons.holiday_village_outlined, _districtController,
                  error: _districtError),
              SizedBox(
                height: 10,
              ),
              _textField('Numero', Icons.pin, _numberController,
                  type: TextInputType.number, error: _numberError),
              SizedBox(
                height: 10,
              ),
              _textField('Clinica', Icons.home_work_outlined, _clinicController,
                  error: _clinicError),
              SizedBox(
                height: 10,
              ),
              _textField('Horário', Icons.timer_outlined, _dateController,
                  error: _dateError, type: TextInputType.datetime),
              SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      _create();
                    },
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
      {TextInputType? type,
      String suffix = '',
      bool obscureText = false,
      String? error}) {
    return TextField(
      controller: _controller,
      keyboardType: type,
      obscureText: obscureText,
      decoration: InputDecoration(
        errorText: error,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red)),
        errorStyle: TextStyle(color: Colors.red, fontSize: 14),
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

  void _create() {
    _userError = validator.nullValidate(_userController.text);
    _bloodError = validator.nullValidate(_bloodController.text);
    _doctorError = validator.nullValidate(_doctorController.text);
    _streetError = validator.nullValidate(_streetController.text);
    _districtError = validator.nullValidate(_districtController.text);
    _numberError = validator.nullValidate(_numberController.text);
    _clinicError = validator.nullValidate(_clinicController.text);
    _dateError = validator.nullValidate(_dateController.text);
    if (_userError == null &&
        _bloodError == null &&
        _doctorError == null &&
        _streetError == null &&
        _districtError == null &&
        _numberError == null &&
        _clinicError == null &&
        _dateError == null) {
      newDonate.blood = _bloodController.text;
      newDonate.name = _userController.text;
      newDonate.number = int.parse(_numberController.text);
      newDonate.street = _streetController.text;
      newDonate.district = _districtController.text;
      newDonate.clinic = _clinicController.text;
      newDonate.doctor = _doctorController.text;
    } else {
      setState(() {});
    }
  }
}
