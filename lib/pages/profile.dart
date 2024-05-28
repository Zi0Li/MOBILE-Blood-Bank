import 'dart:io';
import 'package:blood_bank/controllers/user_controller.dart';
import 'package:blood_bank/data/models/User.dart';
import 'package:blood_bank/pages/home.dart';
import 'package:blood_bank/widgets/AppBar.dart';
import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
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

class _ProfilePageState extends State<ProfilePage> {
  bool skeleton = true;
  int idade = 0;
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _bithController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  int? _checkedTatto;
  bool _checkedYesTatto = false;
  bool _checkedNoTatto = false;

  int? _checkedPigmentacao;
  bool _checkedYesPigmentacao = false;
  bool _checkedNoPigmentacao = false;

  int? _checkedMakeup;
  bool _checkedYesMakeup = false;
  bool _checkedNoMakeup = false;

  String? dropdownHemo;
  String? dropdownState;
  String? dropdownBlood;
  String? _img;

  @override
  void initState() {
    super.initState();

    UserController.internal().getUser().then((value) {
      User user = value;
      setState(() {
        _nicknameController.text = user.name.toString();
        _bithController.text = user.birth.toString();
        _numberController.text = user.number.toString();
        dropdownBlood = user.blood;
        dropdownHemo = user.blood_center;
        dropdownState = user.states;
        (user.tattoo == Config.True)
            ? _checkedYesTatto = true
            : _checkedNoTatto = true;
        (user.pigmentation == Config.True)
            ? _checkedYesPigmentacao = true
            : _checkedNoPigmentacao = true;
        (user.makeup == Config.True)
            ? _checkedYesMakeup = true
            : _checkedNoMakeup = true;
        _img = user.image;

        _checkedMakeup = user.makeup;
        _checkedTatto = user.tattoo;
        _checkedPigmentacao = user.pigmentation;

        idade = int.parse(Config.dateForAge(user.birth.toString()));

        skeleton = false;
      });
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: Skeletonizer(
        enabled: skeleton,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
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
                      "Perfil",
                      style: TextStyle(
                        color: Config.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        ImagePicker()
                            .pickImage(source: ImageSource.camera)
                            .then((file) {
                          if (file == null) {
                            return;
                          } else {
                            setState(() {
                              _img = file.path;
                            });
                          }
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Config.grey0,
                          border: Border.all(
                            width: 1,
                            color: Config.greyBorder,
                          ),
                        ),
                        child: Center(
                          child: _img == null
                              ? Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Config.black,
                                )
                              : Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(
                                        File(
                                          _img!,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _nicknameController.text,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Config.grey2),
                        ),
                        Text(
                          "$idade anos",
                          style: TextStyle(
                            fontSize: 14,
                            color: Config.grey1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.water_drop_outlined,
                          size: 25,
                          color: Config.red,
                        ),
                        Text(
                          dropdownBlood.toString(),
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Atualizar dados do perfil',
                  style: TextStyle(
                    color: Config.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                _input(
                  'Apelido',
                  _nicknameController,
                  TextInputType.text,
                  mask: maskNull,
                ),
                _input(
                  "Telefone",
                  _numberController,
                  TextInputType.number,
                  mask: maskPhone,
                ),
                _input(
                  'Data de nascimento',
                  _bithController,
                  TextInputType.number,
                  mask: maskBirth,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Estado",
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
                      borderSide: BorderSide(color: Config.greyBorder),
                    ),
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
                SizedBox(height: 30),
                Text(
                  "Tipo sanguíneo",
                  style: _textStyle(),
                ),
                SizedBox(height: 10),
                DropdownMenu<dynamic>(
                  width: 230,
                  initialSelection: dropdownBlood,
                  textStyle: _textStyle(),
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Config.greyBorder),
                    ),
                  ),
                  onSelected: (value) {
                    setState(() {
                      dropdownBlood = value!;
                    });
                  },
                  dropdownMenuEntries:
                      Config.bloodType.map<DropdownMenuEntry<String>>(
                    (String value) {
                      return DropdownMenuEntry<String>(
                        value: value,
                        label: value,
                      );
                    },
                  ).toList(),
                ),
                SizedBox(height: 30),
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
                      borderSide: BorderSide(color: Config.greyBorder),
                    ),
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
                SizedBox(height: 30),
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
                SizedBox(height: 30),
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
                SizedBox(height: 30),
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
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
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
                          _updateUser();
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
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
            child: TextFormField(
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
            ),
          )
        ],
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

  void _updateUser() {
    User updateuser = User();

    updateuser.id = 1;
    updateuser.blood = dropdownBlood;
    updateuser.states = dropdownState;
    updateuser.blood_center = dropdownHemo;
    updateuser.name = _nicknameController.text;
    updateuser.birth = _bithController.text;
    updateuser.number =
        int.parse(_numberController.text.replaceAll(RegExp(r'[()\-\ ]'), ''));
    updateuser.makeup = _checkedMakeup;
    updateuser.tattoo = _checkedTatto;
    updateuser.pigmentation = _checkedPigmentacao;
    updateuser.image = _img;

    print('updateUser: $updateuser');
    UserController.internal().updateUser(updateuser).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }
}
