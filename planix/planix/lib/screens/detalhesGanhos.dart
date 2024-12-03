// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:planix/components/card.dart';
import 'package:planix/components/submitButtonPDF.dart';
import 'package:planix/components/textStyle.dart';

class DetalhesGanhos extends StatelessWidget {
  const DetalhesGanhos({super.key});

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
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        color: const Color(0xff2D5186),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 50, top: 24),
                  child: Row(
                    children: [
                      Text('Detalhes: Ganhos', style: txtPoppinsWhite(29)),
                      const SizedBox(width: 8),
                      Image.asset('assets/detalhesGanhos.png', width: 24, height: 24,)
                    ],
                  ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Últimos 6 meses',
                              style: txtPoppinsBold(21),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: DetalhesCard(),
                          ),
                        ),
                        Center(child: Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: CardAzulNormal(370, 141, 'Renda total do mês', 'R\$2300,45'),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0, bottom: 15.0),
                          child: Text(
                            'Detalhes',
                            style: txtPoppins(23),
                          ),
                        ),
                        Center(child: Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: ListaDetalhesGanhos(),
                        )),
                        Center(child: SubmitButtonPDF(onPressed: (){}))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}