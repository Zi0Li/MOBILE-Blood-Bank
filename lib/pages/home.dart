import 'dart:io';
import 'package:blood_bank/controllers/donate_controller.dart';
import 'package:blood_bank/controllers/user_controller.dart';
import 'package:blood_bank/data/models/Donate.dart';

import 'package:blood_bank/pages/donation_form.dart';
import 'package:blood_bank/pages/give_credit.dart';
import 'package:blood_bank/pages/guide.dart';
import 'package:blood_bank/pages/historic.dart';
import 'package:blood_bank/pages/notice.dart';
import 'package:blood_bank/pages/profile.dart';
import 'package:blood_bank/widgets/AppBar.dart';

import 'package:blood_bank/widgets/Loading.dart';
import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<List<Donate>> donate = ValueNotifier<List<Donate>>([]);
  ValueNotifier<bool> donateCheked = ValueNotifier<bool>(true);
  bool _skeletonCheked = true;
  int currentPageIndex = 0, balloonIndex = 0;

  @override
  Widget build(BuildContext context) {
    loadingDonate();

    return Scaffold(
      appBar: TopAppBar(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Config.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: Config.greyBorder,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 10,
          ),
          child: GNav(
            onTabChange: (value) {
              setState(() {
                currentPageIndex = value;
              });
            },
            gap: 5,
            activeColor: Config.red,
            color: Config.black,
            backgroundColor: Config.white,
            iconSize: 25,
            selectedIndex: currentPageIndex,
            textStyle: TextStyle(
              color: Config.red,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: "Home",
              ),
              GButton(
                icon: Icons.notifications_outlined,
                text: "Noticias",
              ),
              GButton(
                icon: Icons.person_outline,
                text: "Perfil",
              ),
              GButton(
                icon: Icons.contact_support_outlined,
                text: "Ajuda",
              ),
            ],
          ),
        ),
      ),
      body: <Widget>[
        _body(),
        NoticePage(),
        ProfilePage(),
        GuidePage(),
      ][currentPageIndex],
    );
  }

  Widget _button(String label, IconData icon, Widget f) {
    return SizedBox(
      width: 108,
      height: 80,
      child: ClipRect(
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide(color: Config.greyBorder),
          ),
          color: Config.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            splashColor: Config.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => f),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 25, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    color: Config.red,
                    size: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ), // <-- Icon
                  Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Config.black),
                  ), // <-- Text
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    final _user = UserController.internal().getUser().then((value) {
      setState(() {});
      return value;
    });

    return FutureBuilder(
      future: _user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Início',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Config.greyBorder,
                        ),
                        child: Center(
                          child: snapshot.data.image == null
                              ? Icon(
                                  Icons.person,
                                  size: 34,
                                )
                              : Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(
                                        File(snapshot.data.image!),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data.name.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Config.grey1,
                            ),
                          ),
                          Text(
                            "${Config.dateForAge(snapshot.data.birth.toString())} anos",
                            style: TextStyle(
                              fontSize: 16,
                              color: Config.grey2,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.water_drop_outlined,
                              size: 25,
                              color: Config.red,
                            ),
                            Text(
                              snapshot.data.blood.toString(),
                              style: TextStyle(fontSize: 22),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Skeletonizer(
                    containersColor: Config.grey0,
                    enabled: _skeletonCheked,
                    child: Config.setBloodBalloon(balloonIndex),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Config.greyBorder,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            _button(
                                "Histórico", Icons.clear_all, HistoricPage()),
                            _button(
                                "Doar",
                                Icons.bloodtype_outlined,
                                DonationFormPage(
                                    snapshot.data.name!, snapshot.data.blood!)),
                            _button(
                                "Guia", Icons.menu_book_outlined, GuidePage()),
                            _button("Configurações", Icons.settings_outlined,
                                HomePage()),
                            _button("Noticias", Icons.volume_up_outlined,
                                NoticePage()),
                            _button("Créditos", Icons.attach_money_outlined,
                                GiveCredtiPage()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedBuilder(
                    animation: Listenable.merge([donate, donateCheked]),
                    builder: (context, child) {
                      if (donateCheked.value) {
                        return Show.LoadingContainer(context);
                      } else if (donate.value.isEmpty) {
                        return Container(
                          child: Center(
                            child: Text(
                              'Nenhuma doação pendente.',
                              style: TextStyle(
                                color: Config.grey2,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return _nextConsult(donate.value[0]);
                      }
                    },
                  )
                ],
              ),
            ),
          );
        } else {
          return Show.LoadingContainer(context);
        }
      },
    );
  }

  Widget _nextConsult(Donate donate) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Próxima consulta",
            style: TextStyle(
              color: Config.grey2,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                size: 30,
                color: Config.grey2,
              ),
              SizedBox(
                width: 10,
              ),
              _text('Data: ', donate.date!)
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 30,
                color: Config.grey2,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _text('Rua: ', donate.street!),
                  _text('Bairro: ', donate.district!),
                  _text('Clínica: ', donate.clinic!),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.maxFinite,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.map_outlined,
                  size: 30,
                  color: Config.red,
                ),
                label: Text(
                  'Ver no mapa',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Config.grey2,
                    fontSize: 18,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Config.grey0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _text(String text1, String text2) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: text1,
        style: TextStyle(
          color: Config.grey1,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: TextStyle(
              color: Config.grey1,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void loadingDonate() {
    DonateController.internal().getDonateStatus(Config.Pendente).then((value) {
      setState(() {
        if (value != null) {
          donate.value = value;
          balloonIndex = 1;
        } else {
          balloonIndex = 0;
        }
        _skeletonCheked = false;
        donateCheked.value = false;
      });
    });
  }
}
