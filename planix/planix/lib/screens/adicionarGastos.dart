// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:planix/components/textFAdicionarDetalhes.dart';
import 'package:planix/components/textStyle.dart';

class AdicionarGastos extends StatelessWidget {
  const AdicionarGastos({super.key});

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
                  child: Text('Adicionar Gastos', style: txtPoppinsWhite(29)),
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
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 25.0),
                              child: Text(
                                'Ganhos',
                                style: txtPoppinsBold(21),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text('Valor:', style: txtPoppins(23)),
                          ),
                          const TextFAdicionarDetalhes(label: 'Escreva o valor',),
                          Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text('Nome:', style: txtPoppins(23)),
                          ),
                          const TextFAdicionarDetalhes(label: 'Escreva o nome',),
                          Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text('Descrição:', style: txtPoppins(23)),
                          ),
                          const TextFAdicionarDetalhes(label: 'Escreva a descrição',),
                          Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text('Mês:', style: txtPoppins(23)),
                          ),
                          const TextFAdicionarDetalhes(label: 'Escreva o mês',),
                          Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text('Tipo:', style: txtPoppins(23)),
                          ),
                          const TextFAdicionarDetalhes(label: 'Escreva o tipo',),
                          const SizedBox(height: 30)
                        ],
                      ),
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