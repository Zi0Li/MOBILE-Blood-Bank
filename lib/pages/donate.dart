import 'package:blood_bank/controllers/donateController.dart';
import 'package:blood_bank/pages/donateForm.dart';
import 'package:flutter/material.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  DonateController donateController = DonateController();
  List<dynamic> donates = [];

  @override
  void initState() {
    super.initState();
    donateController.getAllDonate().then((value) {
      donates = value;
      print('Donates: $donates');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(231, 53, 38, 1),
        title: Text(
          'Doações',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DonateFormPage()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: donateController.getAllDonate(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(231, 53, 38, 1),
                  strokeWidth: 2,
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'ERROR...',
                    style: TextStyle(color: Colors.red, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (snapshot.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Opss...',
                            style: TextStyle(
                                color: Color.fromRGBO(231, 53, 38, 1),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.sentiment_dissatisfied_outlined,
                            color: Color.fromRGBO(231, 53, 38, 1),
                            size: 26,
                          )
                        ],
                      ),
                      Text(
                        'Nenhuma consulta cadastrada',
                        style: TextStyle(
                            color: Color.fromRGBO(231, 53, 38, 1),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DonateFormPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Adicionar',
                          style:
                              TextStyle(color: Color.fromRGBO(231, 53, 38, 1)),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.white,
                          side: BorderSide(
                              color: Color.fromRGBO(231, 53, 38, 1), width: 1),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  itemCount: donates.length,
                  itemBuilder: (context, index) {
                    return _card(context, index);
                  },
                );
              }
          }
        },
      ),
    );
  }

  Widget _card(BuildContext context, int index) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(196, 196, 196, 196),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Próxima Consulta',
                      style: TextStyle(
                          color: Color(0xFFE73526),
                          fontFamily: 'Inter',
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    _text('Data', donates[index].date),
                    _text('Nome', donates[index].name),
                    _text('Doutor(a)', donates[index].doctor),
                    SizedBox(
                      height: 9,
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
                      height: 9,
                    ),
                    _text('Rua', donates[index].street),
                    _text('Bairro', donates[index].district),
                    _text('Clínica', donates[index].clinic)
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 50,
                          color: Color(0xFFE73526),
                        ),
                      ],
                    ),
                    SizedBox(height: 60,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [_text('N°', donates[index].number.toString())],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Mapa',
                            style: TextStyle(fontSize: 16, fontFamily: 'Inter'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _text(String label, String value) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style:
              TextStyle(fontFamily: 'Inter', fontSize: 18, color: Colors.black),
        )
      ],
    );
  }
}
