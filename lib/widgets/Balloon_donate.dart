import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';

class Balloon {
  Balloon._();

  static timeCounter() {
    return Container(
      decoration: BoxDecoration(
        color: Config.yellow,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.notification_important_outlined,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pode doar sangue novamente em:',
                  style: TextStyle(
                    color: Config.grey1,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '3 meses e 19 dias',
                  style: TextStyle(
                    color: Config.grey2,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  static donateNow() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Config.green,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              width: 30,
              height: 30,
              "img/heart_check.png",
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                'Você já pode doar sangue e salvar vidas!',
                style: TextStyle(
                  color: Config.white,
                  fontSize: 16,
                  overflow: TextOverflow.clip,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static notDonate() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Config.grey1,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.heart_broken_outlined,
              size: 30,
              color: Config.white,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                'Parece que ainda você não doou sangue. Doe para salvar vidas!',
                style: TextStyle(
                  color: Config.white,
                  fontSize: 16,
                  overflow: TextOverflow.clip,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
