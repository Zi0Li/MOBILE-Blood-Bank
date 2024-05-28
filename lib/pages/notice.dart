import 'package:blood_bank/data/http/http_client.dart';
import 'package:blood_bank/data/models/Notice.dart';
import 'package:blood_bank/data/repositories/notice_repository.dart';
import 'package:blood_bank/data/stores/notice_store.dart';
import 'package:blood_bank/pages/home.dart';
import 'package:blood_bank/pages/show_notice.dart';
import 'package:blood_bank/widgets/AppBar.dart';
import 'package:blood_bank/widgets/Loading.dart';
import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  String? dropdownValue;

  int countList = 0;
  final NoticeStore store = NoticeStore(
    repository: NoticeRepository(
      client: HttpClient(),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNoticias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: Column(
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
                "Notícias",
                style: TextStyle(
                  color: Config.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => filterNoticias(),
                child: Icon(
                  Icons.filter_alt_outlined,
                  color: Config.red,
                  size: 26,
                ),
              ),
              SizedBox(
                width: 15,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
            child: AnimatedBuilder(
              animation: Listenable.merge(
                [store.erro, store.isLoading, store.state],
              ),
              builder: (context, child) {
                if (store.isLoading.value) {
                  return Show.LoadingContainer(context);
                } else if (store.erro.value != "") {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Config.black12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Desculpe!',
                              style: TextStyle(
                                color: Config.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'ocorreu um erro.',
                              style: TextStyle(
                                color: Config.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                fixedSize: Size.fromHeight(10),
                                backgroundColor: Config.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide( 
                                  width: 1,
                                  color: Config.greyBorder,
                                ),
                              ),
                              label: Text(
                                'Recarregar',
                                style: TextStyle(color: Config.white),
                              ),
                              icon: Icon(
                                Icons.replay_outlined,
                                color: Config.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Expanded(child: _body(store.state.value));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(List<Notice> notices) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: ListView.builder(
          itemCount: store.state.value.length,
          itemBuilder: ((context, index) {
            Notice notice = notices[index];
            return _cardNotice(notice);
          }),
        ),
      ),
    );
  }

  Widget _cardNotice(Notice notice) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Config.greyBorder)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.campaign_outlined,
                    size: 60,
                    color: Config.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      notice.title!,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    notice.created_at!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(166, 166, 166, 1),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowNoticePage(notice),
                    ),
                  );
                },
                child: Container(
                  height: 20,
                  width: double.maxFinite,
                  child: Center(
                    child: Text(
                      "Ver mais",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Config.grey1,
                      ),
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

  void getNoticias() {
    store.getNotices().then((value) {
      // setState(() {
      //   this.countList = store.state.value.length;
      // });
    });
  }

  Future<void> filterNoticias() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filtro'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownMenu<dynamic>(
                width: 230,
                initialSelection: dropdownValue,
                label: Text(
                  'Estado',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Config.grey1,
                ),
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Config.greyBorder)),
                ),
                onSelected: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries:
                    Config.states.map<DropdownMenuEntry<String>>(
                  (String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  },
                ).toList(),
              ),SizedBox(height: 15,),
              DropdownMenu<dynamic>(
                width: 230,
                initialSelection: dropdownValue,
                label: Text(
                  'hemocentro',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Config.grey1,
                ),
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Config.greyBorder)),
                ),
                onSelected: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries:
                    Config.states.map<DropdownMenuEntry<String>>(
                  (String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  },
                ).toList(),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                fixedSize: Size.fromHeight(10),
                backgroundColor: Config.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Config.black12)),
                side: BorderSide(
                  width: 1,
                  color: Config.greyBorder,
                ),
              ),
              child: Text(
                'Cancelar',
                style: TextStyle(color: Config.grey2),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                fixedSize: Size.fromHeight(10),
                backgroundColor: Config.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                  width: 1,
                  color: Config.greyBorder,
                ),
              ),
              child: Text(
                'Filtrar',
                style: TextStyle(color: Config.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
