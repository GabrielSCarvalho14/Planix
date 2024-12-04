// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:planix/components/textStyle.dart'; 

class CardAzul extends StatefulWidget {
  const CardAzul({super.key});

  @override
  _CardAzulState createState() => _CardAzulState();
}

class _CardAzulState extends State<CardAzul> {
  bool _isHidden = true; // Estado para controlar se o valor está oculto

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353, // Largura fixa do cartão
      height: 103, // Altura fixa do cartão
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xff2D5287),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Ícone de olho posicionado no canto superior direito
          Positioned(
            top: -15,
            right: -10,
            child: IconButton(
              icon: Icon(
                _isHidden
                    ? Icons.visibility_off_outlined // Ícone de olho cortado
                    : Icons.visibility_outlined, // Ícone de olho aberto
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isHidden = !_isHidden; // Alterna o estado de visibilidade
                });
              },
            ),
          ),
          // Centralização dos textos no meio do cartão
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Atual', style: txtPoppinsWhite(12)),
                const SizedBox(height: 8),
                Text(
                  _isHidden
                      ? '**********'
                      : 'R\$ 10.000,00', // Mostra/esconde o valor
                  style: txtPoppinsWhiteBold(32),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget CardAzulNormal(double largura, double altura, String titulo, String descricao) {
  return SizedBox(
      width: largura,
      height: altura,
      child: Card(
          color: const Color(0xff2D5287),
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(titulo, style: txtPoppinsWhite(19)),
            Text(descricao, style: txtPoppinsWhiteBold(25))
          ])));
}

Widget CardBalanco(String tipo, String valorSalario, String porcentagem) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      width: 300,
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Cabeçalho com fundo azul
          Container(
            width: double.infinity, // Garante que a largura seja total
            decoration: const BoxDecoration(
              color: Color(0xff2D5186), // Cor de fundo azul
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Salário",
                  style: txtDongleBrancoBold(18),
                ),
                Text(
                  tipo,
                  style: txtDongleBrancoBold(18),
                ),
              ],
            ),
          ),
          // Conteúdo principal
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16), // Ajuste uniforme
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    valorSalario,
                    style: txtPoppinsGreyEscuro(15),
                  ),
                  Text(
                    porcentagem,
                    style: txtPoppinsGreyEscuro(15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget CardBranco() {
  return SizedBox(
      width: 340,
      height: 103,
      child: Card(
          color: const Color(0xffF2F2F2),
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                          width: 20,
                          height: 21,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xff2D5186),
                          ),
                        ),
                      ),
                      Text(
                        'Contas já pagas',
                        style: txtPoppins(15),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                          width: 20,
                          height: 21,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xff98B6E2),
                          ),
                        ),
                      ),
                      Text(
                        'Contas não pagas',
                        style: txtPoppins(15),
                      )
                    ],
                  )
                ]),
          )));
}

Widget CardAzulTroca(bool isPaga, String conta, String data, double largura, double altura) {
  return SizedBox(
      width: largura,
      height: altura,
      child: Card(
          color: isPaga ? const Color(0xff2D5287) : const Color(0xff98B6E2),
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(conta, style: txtPoppinsWhite(20)),
                Text(data, style: txtPoppinsWhiteBold(19))
              ],
            ),
          )));
}

Widget CardCinza(String imagem, String texto, double largura, double altura) {
  return SizedBox(
      width: largura,
      height: altura,
      child: Card(
          color: const Color(0xffF8F8F8),
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 14.0),
                  child: Image.asset(
                    imagem,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 14.0),
                  child: Text(
                    texto,
                    style: txtPoppinsAzulBold(16),
                  ),
                )
              ])));
}

Widget CardCinzaAlongado(String imagem, String texto, double largura, double altura) {
  return SizedBox(
      width: largura,
      height: altura,
      child: Card(
          color: const Color(0xffF8F8F8),
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 14.0),
                    child: Image.asset(
                      imagem,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 14.0),
                    child: Text(
                      texto,
                      style: txtPoppinsAzulBold(16),
                    ),
                  ),
                )
              ])));
}

Widget CardCinzaVazio() {
  return SizedBox(
      width: 177,
      height: 147,
      child: Card(
          color: const Color(0xffF8F8F8),
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [])));
}

Widget StreamingCard() {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Título
          Text(
            'Streamings',
            style: txtPoppinsPreto(15)),
          Row(
            children: [
              // Valor
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF8F8F8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'R\$150,00',
                  style: txtPoppinsPreto(15),
                ),
              ),
              const SizedBox(width: 8),
              // Ícone de seta
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black54,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget DetalhesCard() {
  return Center(
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: 134,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Título
            Text(
              'Dezembro',
              style: txtPoppinsPreto(15)),
            // Ícone de seta
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget ListaGastos() {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Cabeçalho com fundo azul
          Container(
            width: double.infinity, // Garante que a largura seja total
            decoration: const BoxDecoration(
              color: Color(0xff2D5186), // Cor de fundo azul
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gastos",
                  style: txtDongleBrancoBold(18),
                ),
                Text(
                  "Valor",
                  style: txtDongleBrancoBold(18),
                ),
              ],
            ),
          ),
          // Conteúdo principal
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16), // Ajuste uniforme
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Max',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                      Text(
                        'R\$55,90',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Netflix',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                      Text(
                        'R\$59,90',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Prime Video',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                      Text(
                        'R\$19,90',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NBA League Pass',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                      Text(
                        'R\$54,90',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget ListaDetalhesGanhos() {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      width: 340,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity, 
            decoration: const BoxDecoration(
              color: Color(0xff2D5186), 
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Renda",
                  style: txtDongleBrancoBold(18),
                ),
                Text(
                  "Valor",
                  style: txtDongleBrancoBold(18),
                ),
              ],
            ),
          ),
          // Conteúdo principal
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16), // Ajuste uniforme
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Salário',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                      Text(
                        'R\$1309,00',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Vendas',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                      Text(
                        'R\$220,00',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '13° Salário',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                      Text(
                        'R\$750,00',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'FGTS',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                      Text(
                        'R\$534,00',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget ListaDetalhesGastos() {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      width: 340,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity, 
            decoration: const BoxDecoration(
              color: Color(0xff2D5186), 
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Renda",
                  style: txtDongleBrancoBold(18),
                ),
                Text(
                  "Valor",
                  style: txtDongleBrancoBold(18),
                ),
              ],
            ),
          ),
          // Conteúdo principal
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16), // Ajuste uniforme
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'MAX',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                      Text(
                        'R\$59,90',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Netflix',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                      Text(
                        'R\$60,00',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Aluguel',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                      Text(
                        'R\$1000,00',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Água',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                      Text(
                        'R\$110,00',
                        style: txtPoppinsGreyEscuro(15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}