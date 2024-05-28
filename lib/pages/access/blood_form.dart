// ignore_for_file: must_be_immutable
import 'package:blood_bank/controllers/user_controller.dart';
import 'package:blood_bank/data/models/User.dart';
import 'package:blood_bank/pages/home.dart';
import 'package:blood_bank/widgets/AppBar.dart';
import 'package:blood_bank/widgets/Loading.dart';
import 'package:blood_bank/widgets/SnackMessage.dart';
import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BloodFormPage extends StatefulWidget {

  Map<String,dynamic> user = {};

  BloodFormPage({required this.user,super.key});

  @override
  State<BloodFormPage> createState() => _BloodFormPageState();
}

var maskPhone = MaskTextInputFormatter(
  mask: '(##) # ####-####',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

var maskBirth = MaskTextInputFormatter(
  mask: '##/##/####',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

var maskNull = MaskTextInputFormatter();

const List<String> bloodType = [
  'A+',
  'A-',
  'B+',
  'B-',
  'AB+',
  'AB-',
  'O+',
  'O-'
];

class _BloodFormPageState extends State<BloodFormPage> {
  User user = User();

  late int _checkedTatto;
  bool _checkedYesTatto = false;
  bool _checkedNoTatto = false;

  late int _checkedPigmentacao;
  bool _checkedYesPigmentacao = false;
  bool _checkedNoPigmentacao = false;

  late int _checkedMakeup;
  bool _checkedYesMakeup = false;
  bool _checkedNoMakeup = false;

  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
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
                Text(
                  "Possui tatuagens?",
                  style: _textStyle(),
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Config.white,
                      side: BorderSide(color: Config.red),
                      activeColor: Config.red,
                      value: _checkedYesTatto,
                      onChanged: (value) {
                        setState(
                          () {
                            _checkedYesTatto = value!;
                            _checkedNoTatto = false;
                            _checkedTatto = Config.True;
                          },
                        );
                      },
                    ),
                    Text(
                      "Sim",
                      style: _textStyle(),
                    ),
                    Checkbox(
                      checkColor: Config.white,
                      side: BorderSide(color: Config.red),
                      activeColor: Config.red,
                      value: _checkedNoTatto,
                      onChanged: (value) {
                        setState(
                          () {
                            _checkedNoTatto = value!;
                            _checkedYesTatto = false;
                            _checkedTatto = Config.False;
                          },
                        );
                      },
                    ),
                    Text(
                      "Não",
                      style: _textStyle(),
                    )
                  ],
                ),
                SizedBox(height: 26),
                Text(
                  "Possui micro pigmentação?",
                  style: _textStyle(),
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Config.white,
                      side: BorderSide(color: Config.red),
                      activeColor: Config.red,
                      value: _checkedYesPigmentacao,
                      onChanged: (value) {
                        setState(
                          () {
                            _checkedYesPigmentacao = value!;
                            _checkedNoPigmentacao = false;
                            _checkedPigmentacao = Config.True;
                          },
                        );
                      },
                    ),
                    Text(
                      "Sim",
                      style: _textStyle(),
                    ),
                    Checkbox(
                      checkColor: Config.white,
                      side: BorderSide(color: Config.red),
                      activeColor: Config.red,
                      value: _checkedNoPigmentacao,
                      onChanged: (value) {
                        setState(
                          () {
                            _checkedNoPigmentacao = value!;
                            _checkedYesPigmentacao = false;
                            _checkedPigmentacao = Config.False;
                          },
                        );
                      },
                    ),
                    Text(
                      "Não",
                      style: _textStyle(),
                    )
                  ],
                ),
                SizedBox(height: 26),
                Text(
                  "Possui maquiagem definitiva?",
                  style: _textStyle(),
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Config.white,
                      side: BorderSide(color: Config.red),
                      activeColor: Config.red,
                      value: _checkedYesMakeup,
                      onChanged: (value) {
                        setState(
                          () {
                            _checkedYesMakeup = value!;
                            _checkedNoMakeup = false;
                            _checkedMakeup = Config.True;
                          },
                        );
                      },
                    ),
                    Text(
                      "Sim",
                      style: _textStyle(),
                    ),
                    Checkbox(
                      checkColor: Config.white,
                      side: BorderSide(color: Config.red),
                      activeColor: Config.red,
                      value: _checkedNoMakeup,
                      onChanged: (value) {
                        setState(
                          () {
                            _checkedNoMakeup = value!;
                            _checkedYesMakeup = false;
                            _checkedMakeup = Config.False;
                          },
                        );
                      },
                    ),
                    Text(
                      "Não",
                      style: _textStyle(),
                    )
                  ],
                ),
                SizedBox(height: 26),
                Text(
                  "Tipo sanguíneo ",
                  style: _textStyle(),
                ),
                SizedBox(height: 10),
                DropdownMenu<dynamic>(
                  width: 230,
                  initialSelection: dropdownValue,
                  textStyle: _textStyle(),
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Config.greyBorder)),
                  ),
                  onSelected: (value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  dropdownMenuEntries: bloodType.map<DropdownMenuEntry<String>>(
                    (String value) {
                      return DropdownMenuEntry<String>(
                        value: value,
                        label: value,
                      );
                    },
                  ).toList(),
                )
              ],
            ),
            SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.maxFinite,
                height: 52,
                child: TextButton(
                  onPressed: () {
                    if (validator()) {
                      _saveUser();
                    }
                  },
                  child: Text(
                    'Concluir cadastro',
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
            ),
          ],
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

  bool validator() {
    if (_checkedNoMakeup == false &&
        _checkedYesMakeup == false ||
        _checkedNoPigmentacao == false &&
        _checkedYesPigmentacao == false ||
        _checkedNoTatto == false &&
        _checkedYesTatto == false ||
        dropdownValue == null) {
      ShowSnackMessage.snackMessageMandatory(context);
      return false;
    } else {
      return true;
    }
  }

  void _saveUser() {
    user.id = 1;
    user.blood = dropdownValue;
    user.name = widget.user['nickname'];
    user.birth = widget.user['birth'];
    user.number = int.parse(widget.user['number']);
    user.makeup = _checkedMakeup;
    user.tattoo = _checkedTatto;
    user.pigmentation = _checkedPigmentacao;
    user.states = widget.user['state'];
    user.blood_center = widget.user['hemo'];

    print(user);

    Show.LoadingDialog(context);
    UserController.internal().saveUser(user).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }
}
