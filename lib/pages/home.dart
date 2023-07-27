import 'package:blood_bank/controllers/donateController.dart';
import 'package:blood_bank/pages/guide.dart';
import 'package:blood_bank/pages/login.dart';
import 'package:blood_bank/pages/news.dart';
import 'package:blood_bank/widgets/AppBar.dart';
import 'package:blood_bank/widgets/Button.dart';
import 'package:blood_bank/widgets/MessageBalloon.dart';
import 'package:blood_bank/widgets/NavigationBar.dart';
import 'package:blood_bank/widgets/NextConsultation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DonateController controller = DonateController();
  List<dynamic> donates = [];

  @override
  void initState() {
    super.initState();
    Donate d = Donate();

    // d.date = '2222';
    // d.clinic = '2222';
    // d.district = '2222';
    // d.number = 2222;
    // d.street = '2222';
    // controller.saveDonate(d);
    controller.deleteAll();
    controller.getAllDonate().then((value){
      donates = value;
      print(donates);
      controller.deleteDonate(1);
    });

    // controller.getAllDonate().then((value){
    //   donates=value;
    //   print('------------------------');
    //   print(donates[1].id);
    // });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar('Marcelo', '21', 'B-'),
      backgroundColor: Color.fromRGBO(253, 253, 253, 1),
      bottomNavigationBar: NavigationAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(27, 28, 27, 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Button('Histórico', 'icons/Notes.svg', LoginPage()),
                  SizedBox(
                    width: 25,
                  ),
                  Button('Doar', 'icons/Syringe.svg', LoginPage()),
                  SizedBox(
                    width: 25,
                  ),
                  Button('Guia', 'icons/Book.svg', GuidePage()),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Button('Config.', 'icons/Setting.svg', LoginPage()),
                  SizedBox(
                    width: 25,
                  ),
                  Button(
                      'Notícias', 'icons/Notification_Status.svg', NewsPage()),
                  SizedBox(
                    width: 25,
                  ),
                  Button('Créditos', 'icons/2profile.svg', LoginPage()),
                ],
              ),
              SizedBox(
                height: 28,
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
                height: 25,
              ),
              MessageBallon('Pode doar sangue novamente em:',
                  '3 meses e 19 dias', Icons.dangerous),
              SizedBox(
                height: 25,
              ),
              NextConsultation('21/04/2023', 'Rio Claro', '10',
                  'Vila Progresso', 'Dr. Alberto'),
                  SizedBox(
                height: 28,
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
                height: 25,
              ), 
            ],
          ),
        ),
      ),
    );
  }
}
