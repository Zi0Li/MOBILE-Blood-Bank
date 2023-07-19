import 'package:flutter/material.dart';

class TopAppBar extends StatefulWidget {
  const TopAppBar({super.key});

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(
            Icons.person,
            size: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Marcelo Zioli',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Idade',
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(231, 53, 38, 1),
      actions: [
        ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.water_drop,
                color: Colors.white,
                size: 26,
              ),
              Text(
                'A+',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(231, 53, 38, 1)),
        ),
      ],
    );
  }
}
