import 'package:blood_bank/pages/access/user_form.dart';
import 'package:blood_bank/widgets/AppBar.dart';
import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                width: 230,
                height: 230,
                "img/doar_sangue.png",
              ),
              SizedBox(
                height: 55,
              ),
              _text("Bem-vindo ao ", "Blood Bank"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Organize suas doações de sangue com facilidade, porque cada gota conta.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Config.black,
                  overflow: TextOverflow.clip,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserFormPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Começar",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Config.white,
                        size: 18,
                      )
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Config.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String text1, String text2) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: text1,
        style: _style(Config.black),
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: _style(Config.red),
          ),
          TextSpan(
            text: "!",
            style: _style(Config.black),
          ),
        ],
      ),
    );
  }

  TextStyle _style(Color color) {
    return TextStyle(
      fontSize: 24,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }
}
