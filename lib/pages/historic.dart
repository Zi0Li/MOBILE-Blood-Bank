// ignore_for_file: must_be_immutable

import 'package:blood_bank/controllers/donate_controller.dart';
import 'package:blood_bank/data/models/Donate.dart';
import 'package:blood_bank/pages/home.dart';
import 'package:blood_bank/widgets/AppBar.dart';
import 'package:blood_bank/widgets/Loading.dart';
import 'package:blood_bank/widgets/config.dart';
import 'package:flutter/material.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  List<Widget> filter = <Widget>[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Concluído',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Cancelado',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Pendente',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    )
  ];

  final List<bool> _selectFilter = <bool>[false, false, false];
  bool clearFilter = true;
  String auxText = '';

  var _donate = DonateController.internal().getAllDonate().then((value) {
    return value;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: FutureBuilder(
          future: _donate,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _body(snapshot.data!);
            } else {
              return Show.LoadingContainer(context);
            }
          }),
    );
  }

  Widget _body(List<dynamic> donate) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                "Histórico",
                style: TextStyle(
                  color: Config.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Row(
            children: [
              clearFilter
                  ? Text(
                      'Filtrar',
                      style: TextStyle(
                        color: Config.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        _getAllDonates();
                      },
                      child: Text(
                        'Limpar',
                        style: TextStyle(
                          color: Config.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
              clearFilter
                  ? SizedBox(
                      width: 20,
                    )
                  : SizedBox(
                      width: 10,
                    ),
              ToggleButtons(
                direction: Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _selectFilter.length; i++) {
                      _selectFilter[i] = i == index;
                    }

                    clearFilter = false;
                    if (index == 0) {
                      auxText = 'concluídas';
                      _getDonateStatus(Config.Concluido);
                    } else if (index == 1) {
                      auxText = 'canceladas';
                      _getDonateStatus(Config.Cancelado);
                    } else {
                      auxText = 'pendentes';
                      _getDonateStatus(Config.Pendente);
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                selectedColor: Colors.white,
                fillColor: Colors.grey,
                color: Config.grey2,
                constraints: const BoxConstraints(
                  minHeight: 20.0,
                  minWidth: 80.0,
                ),
                isSelected: _selectFilter,
                children: filter,
              ),
            ],
          ),
          Divider(),
          (donate.isNotEmpty)
              ? Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: donate.length,
                      itemBuilder: ((context, index) {
                        var item = donate[index];
                        return _donateCard(item, index);
                      }),
                    ),
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Não existe doações $auxText',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Config.grey1,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _donateCard(Donate donate, int index) {
    String textStatus;
    IconData iconStatus;
    Color colorBorder = Config.greyBorder, colorContainer = Config.greyBorder;
    if (donate.status == Config.Concluido) {
      iconStatus = Icons.task_alt_outlined;
      textStatus = Config.Concluido;
      colorBorder = Config.green;
      colorContainer = Config.greenOpacity;
    } else if (donate.status == Config.Cancelado) {
      textStatus = Config.Cancelado;
      colorBorder = Config.red;
      colorContainer = Config.redOpacity;
      iconStatus = Icons.unpublished_outlined;
    } else {
      iconStatus = Icons.priority_high_rounded;
      textStatus = Config.Pendente;
      colorBorder = Config.orange;
      colorContainer = Config.orangeOpacity;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: GestureDetector(
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Atenção!'),
              content: Container(
                child: Text('Deseja excluir essa doação ?'),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              actionsAlignment: MainAxisAlignment.end,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(
                      width: 1,
                      color: Config.greyBorder,
                    ),
                  ),
                  child: Text(
                    'Não',
                    style: TextStyle(
                      color: Config.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    DonateController.internal().deleteDonate(donate.id!);
                    _getAllDonates();
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
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
                    'Sim',
                    style: TextStyle(
                      color: Config.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: colorBorder),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 34,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: colorContainer,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: colorBorder,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        iconStatus,
                        size: 18,
                        color: colorBorder,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        textStatus,
                        style: TextStyle(
                          color: colorBorder,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _text('Doador: ', donate.name.toString()),
                        _text('Doutor(a): ', donate.doctor.toString()),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _text('Agendado: ', donate.date!),
                        _text('Sangue: ', donate.blood.toString()),
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 32,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _text("Rua: ", donate.street.toString()),
                        _text("Numero: ", donate.number.toString()),
                        _text("Bairro: ", donate.district.toString()),
                        _text("Clínica: ", donate.clinic.toString()),
                      ],
                    )
                  ],
                ),
                (donate.status == Config.Pendente)
                    ? Column(
                        children: [
                          Divider(),
                          Row(
                            children: [
                              _buttonPedente(
                                'Cancelado',
                                donate,
                                Config.Cancelado,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              _buttonPedente(
                                'Concluído',
                                donate,
                                Config.Concluido,
                              )
                            ],
                          )
                        ],
                      )
                    : Container()
              ],
            ),
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
        style: TextStyle(
          fontSize: 14,
          color: Config.grey2,
          fontWeight: FontWeight.w600,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Config.grey1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void _getDonateStatus(String status) {
    _donate = DonateController.internal().getDonateStatus(status).then((value) {
      setState(() {});
      return (value == null) ? [] : value;
    });
  }

  void _getAllDonates() {
    _donate = DonateController.internal().getAllDonate().then((value) {
      return value;
    });
    _clearFilter();
  }

  void _clearFilter() {
    setState(() {
      clearFilter = true;
      for (int i = 0; i < _selectFilter.length; i++) {
        _selectFilter[i] = false;
      }
    });
  }

  Widget _buttonPedente(String label, Donate donate, String status) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          donate.status = status;
          DonateController.internal().updateDonate(donate).then((value) {
            setState(() {});
          });
        },
        child: Text(
          label,
          style: TextStyle(
            color: Config.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: TextButton.styleFrom(
          side: BorderSide(
            width: 1,
            color: Config.greyBorder,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
