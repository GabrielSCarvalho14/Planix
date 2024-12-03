// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:planix/components/textFTarefaDescricao.dart';
import 'package:planix/components/textFTarefaTitulo.dart';
import 'package:planix/components/textStyle.dart';

class CriarMetas extends StatefulWidget {
  const CriarMetas({super.key});

  @override
  State<CriarMetas> createState() => _CriarMetasState();
}

class _CriarMetasState extends State<CriarMetas> {
  int selectedDay = 1;
  int selectedMonth = 1;
  int selectedHour = 0;
  int selectedMinute = 0;
  String selectedPeriod = "AM";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2D5186),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xffFFFFFF)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Container(
        color: const Color(0xff2D5186),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 50, top: 24),
              child: Text('Adicionar Meta', style: txtPoppinsWhite(29)),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Color(0xFFFFFFFF),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text("Data e Hora", style: txtPoppinsAzul(22)),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          _buildPicker("Dia", 1, 31, selectedDay, (value) {
                            setState(() {
                              selectedDay = value;
                            });
                          }),
                          _buildPicker("Mês", 1, 12, selectedMonth, (value) {
                            setState(() {
                              selectedMonth = value;
                            });
                          }),
                          _buildPicker("Hora", 1, 12, selectedHour, (value) {
                            setState(() {
                              selectedHour = value;
                            });
                          }),
                          _buildPicker("Minuto", 0, 59, selectedMinute,
                              (value) {
                            setState(() {
                              selectedMinute = value;
                            });
                          }),
                          _buildPicker(
                            "",
                            0,
                            1,
                            selectedPeriod == "AM" ? 0 : 1,
                            (value) {
                              setState(() {
                                selectedPeriod = value == 0 ? "AM" : "PM";
                              });
                            },
                            items: ["AM", "PM"],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text('Título:', style: txtPoppinsPreto(22))),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 80.0),
                      child: TextFTarefaTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text('Descrição', style: txtPoppinsPreto(22)),
                    ),
                    const TextFTarefaDescricao()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPicker(
    String label,
    int minValue,
    int maxValue,
    int selectedValue,
    ValueChanged<int> onSelectedItemChanged, {
    List<String>? items,
  }) {
    return Column(
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: txtPoppinsPreto(16),
          ),
        Container(
          height: 100,
          width: 60,
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(
              initialItem: selectedValue - minValue,
            ),
            itemExtent: 32,
            onSelectedItemChanged: onSelectedItemChanged,
            magnification: 1.4,
            backgroundColor: Colors.transparent,
            selectionOverlay: Container(),
            children: items != null
                ? items
                    .map((item) => Center(
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ))
                    .toList()
                : List.generate(
                    maxValue - minValue + 1,
                    (index) => Center(
                      child: Text(
                        (minValue + index).toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
