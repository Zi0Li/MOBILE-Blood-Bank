import 'package:blood_bank/pages/access/address_form.dart';
import 'package:blood_bank/widgets/AppBar.dart';
import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({super.key});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  bool _checkBox = false;

  

  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _bithController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

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
                _input(
                  "Apelido",
                  _nicknameController,
                  TextInputType.text,
                  mask: Config.maskNull,
                ),
                SizedBox(
                  height: 26,
                ),
                _input(
                  "Data de nascimento",
                  _bithController,
                  TextInputType.number,
                  mask: Config.maskBirth,
                ),
                SizedBox(
                  height: 26,
                ),
                _input(
                  "Telefone",
                  _numberController,
                  TextInputType.phone,
                  mask: Config.maskPhone,
                ),
                SizedBox(
                  height: 26,
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Config.white,
                      side: BorderSide(color: Config.red),
                      activeColor: Config.red,
                      value: _checkBox,
                      onChanged: (value) {
                        setState(() {
                          _checkBox = _checkBox ? false : true;
                        });
                      },
                    ),
                    Text(
                      "Envia-me notificações",
                      style: TextStyle(
                        color: Config.grey2,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
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

                      Map<String, dynamic> user = {
                        'nickname' : _nicknameController.text,
                        'birth' : _bithController.text,
                        'number': _numberController.text.replaceAll(RegExp(r'[()\-\ ]'), '')
                      };

                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressFormPage(user: user,),
                          ),
                        );
                      }
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
      ),
    );
  }

  Widget _input(String label, TextEditingController controller,
      TextInputType keyboardType,
      {TextInputFormatter? mask}) {
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
        TextFormField(
          validator: Config.validator,
          controller: controller,
          inputFormatters: [mask!],
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Config.greyBorder),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
