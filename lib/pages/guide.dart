import 'package:accordion/accordion.dart';
import 'package:blood_bank/controllers/requirements_controller.dart';
import 'package:blood_bank/pages/home.dart';
import 'package:blood_bank/widgets/AppBar.dart';
import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.white,
      appBar: TopAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
                  "Guia",
                  style: TextStyle(
                    color: Config.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                child: Accordion(
                  headerBorderColorOpened: Config.greyBorder,
                  headerBorderWidth: 1,
                  contentBackgroundColor: Colors.white,
                  contentBorderColor: Config.greyBorder,
                  contentBorderWidth: 1,
                  scaleWhenAnimating: true,
                  openAndCloseAnimation: true,
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  children: [
                    AccordionSection(
                        rightIcon: Icon(
                          Icons.arrow_downward,
                          size: 20,
                        ),
                        headerBackgroundColor: Colors.white,
                        isOpen: false,
                        headerBorderColor: Config.greyBorder,
                        header: const Text(
                          'Requisitos básicos',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: Column(
                          children: [
                            for (int i = 0; i < Requirements.basic.length; i++)
                              _text(Requirements.basic[i])
                          ],
                        )),
                    AccordionSection(
                        rightIcon: Icon(
                          Icons.arrow_downward,
                          size: 20,
                        ),
                        headerBackgroundColor: Colors.white,
                        isOpen: false,
                        contentVerticalPadding: 20,
                        headerBorderColor: Config.greyBorder,
                        header: const Text(
                          'Requisitos temporários',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: Column(
                          children: [
                            for (int i = 0;
                                i < Requirements.temporary.length;
                                i++)
                              _text(Requirements.temporary[i])
                          ],
                        )),
                    AccordionSection(
                      rightIcon: Icon(
                        Icons.arrow_downward,
                        size: 20,
                      ),
                      headerBackgroundColor: Colors.white,
                      isOpen: false,
                      contentVerticalPadding: 20,
                      headerBorderColor: Config.greyBorder,
                      header: const Text(
                        'Requisitos definitivos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      content: Column(
                        children: [
                          for (int i = 0;
                              i < Requirements.definitive.length;
                              i++)
                            _text(Requirements.definitive[i])
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _text(String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Icon(
              Icons.circle,
              size: 7,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Config.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
