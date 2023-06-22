import 'package:blood_bank/widgets/Button.dart';
import 'package:blood_bank/widgets/Message_Balloon.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 253, 253, 1),
      body: Padding(
        padding: EdgeInsets.fromLTRB(27, 28, 27, 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Button(
                  'Histórico',
                  'icons/Notes.svg',
                ),
                SizedBox(
                  width: 25,
                ),
                Button('Doar', 'icons/Syringe.svg'),
                SizedBox(
                  width: 25,
                ),
                Button('Guia', 'icons/Book.svg'),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Button('Config.', 'icons/Setting.svg'),
                SizedBox(
                  width: 25,
                ),
                Button('Notícias', 'icons/Notification_Status.svg'),
                SizedBox(
                  width: 25,
                ),
                Button('Créditos', 'icons/2profile.svg'),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              width: 352,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFD0D0D0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Message_Ballon('Pode doar sangue novamente em:',
                '3 meses e 19 dias', Icons.dangerous),
          ],
        ),
      ),
    );
  }
}
