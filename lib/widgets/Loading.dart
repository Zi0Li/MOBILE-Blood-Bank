import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';

class Show {
  Show._();

  static LoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: Config.red,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Carregando dados",
                  style: TextStyle(
                    color: Config.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
      ),
    );
  }

  static LoadingContainer(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: Config.red,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Carregando dados",
              style: TextStyle(
                color: Config.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
