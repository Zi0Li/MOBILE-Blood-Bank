import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';

class ShowSnackMessage {
  ShowSnackMessage._();

  static snackMessageMandatory(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Config.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Por favor, preencha todos os campos!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      showCloseIcon: true,
      closeIconColor: Colors.white,
      backgroundColor: Config.red,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20),
      duration: const Duration(seconds: 3),
      shape: OutlineInputBorder(
        borderSide: BorderSide(width: 0),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    return snackBar;
  }
}