// ignore_for_file: non_constant_identifier_names

import 'package:blood_bank/widgets/Balloon_donate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Config {
  Config._();

  static const List<String> bloodType = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  static List<String> states = [
    'Acre',
    'Alagoas',
    'Amapá',
    'Amazonas',
    'Bahia',
    'Ceará',
    'Distrito Federal',
    'Espírito Santo',
    'Goiás',
    'Maranhão',
    'Mato Grosso',
    'Mato Grosso do Sul',
    'Minas Gerais',
    'Pará',
    'Paraíba',
    'Paraná',
    'Pernambuco',
    'Piauí',
    'Rio de Janeiro',
    'Rio Grande do Norte',
    'Rio Grande do Sul',
    'Rondônia',
    'Roraima',
    'Santa Catarina',
    'São Paulo',
    'Sergipe',
    'Tocantins',
  ];

  static int True = 1;
  static int False = 0;

  static String Pendente = 'Pendente';
  static String Cancelado = 'Cancelado';
  static String Concluido = 'Concluído';

  static Color black12 = Colors.black12;
  static Color black = Colors.black;
  static Color green = Color.fromRGBO(31, 170, 8, 1);
  static Color greenOpacity = Color.fromRGBO(31, 170, 8, 0.1);
  static Color grey0 = Color.fromRGBO(242, 242, 242, 1);
  static Color grey1 = Color.fromRGBO(81, 80, 82, 1);
  static Color grey2 = Color.fromRGBO(51, 49, 56, 1);
  static Color greyBorder = Color.fromRGBO(231, 231, 231, 1);
  static Color red = Color.fromRGBO(237, 28, 36, 1);
  static Color redOpacity = Color.fromRGBO(237, 28, 36, 0.1);
  static Color yellow = Color.fromRGBO(255, 245, 0, 1);
  static Color white = Colors.white;
  static Color orange = Color.fromRGBO(221, 181, 0, 1);
  static Color orangeOpacity = Color.fromRGBO(221, 181, 0, 0.1);

  static var maskPhone = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static var maskBirth = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static var maskNull = MaskTextInputFormatter();

  static String? validator(value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório!';
    }
    return null;
  }

  static String dateFormatter(String value) {
    print(value);
    print(value.runtimeType == String);
    DateTime aux = DateTime.parse(value);
    var date = DateFormat('dd/MM/yyyy').format(aux);
    return date;
  }

  static String dateForAge(String date) {
    var listDate = (date.split('/'));

    DateTime dataNascimento = DateTime(
      int.parse(listDate[2]),
      int.parse(listDate[1]),
      int.parse(listDate[0]),
    );

    DateTime dataAtual = DateTime.now();
    int idade = dataAtual.year - dataNascimento.year;

    if (dataNascimento.month > dataAtual.month ||
        (dataNascimento.month == dataAtual.month &&
            dataNascimento.day > dataAtual.day)) {
      idade--;
    }

    return idade.toString();
  }

  static Widget setBloodBalloon(int num) {
    if (num == 1) {
      return Balloon.timeCounter();
    } else if (num == 2) {
      return Balloon.donateNow();
    } else {
      return Balloon.notDonate();
    }
  }
}
