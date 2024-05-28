// ignore_for_file: must_be_immutable

import 'package:blood_bank/data/models/Notice.dart';
import 'package:blood_bank/widgets/AppBar.dart';
import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ShowNoticePage extends StatefulWidget {
  Notice notice;

  ShowNoticePage(this.notice, {super.key});

  @override
  State<ShowNoticePage> createState() => _ShowNoticePageState();
}

class _ShowNoticePageState extends State<ShowNoticePage> {
  var _htmlContent;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _htmlContent =
        """<div style=" font-size: 16px; font-align: 16px; text-align: justify; font-family: Inter; word-wrap: break-word">${widget.notice.body}</div>""";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 28,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      print('Ir ao site');
                    },
                    icon: Icon(
                      Icons.web_rounded,
                      size: 28,
                      color: Config.red,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Config.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          width: 1,
                          color: Config.greyBorder,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                widget.notice.title!,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Config.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.clip,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'publicado: ${widget.notice.created_at}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(166, 166, 166, 1),
                  fontStyle: FontStyle.italic,
                ),
              ),
              Divider(),
              Html(
                data: _htmlContent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
