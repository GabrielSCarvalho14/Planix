import 'package:flutter/material.dart';
import 'package:planix/components/card.dart';
import 'package:planix/components/submitButtonDados.dart';
import 'package:planix/components/textStyle.dart';
import 'package:planix/screens/adicionarGastos.dart';
import 'package:planix/screens/detalhesGastos.dart';

class Gastos extends StatelessWidget {
  const Gastos({super.key});

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
                  child: Text('Gastos', style: txtPoppinsWhite(29)),
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
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, bottom: 40, right: 16, left: 16),
                            child: CardAzulNormal(
                                319, 147, 'Principal gasto', 'STREAMING'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Balanço', style: txtPoppins(23)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DetalhesGastos()),
                                    );
                                  },
                                  child: Text('Ver detalhes', style: txtPoppinsSublinhadoAzul(12)))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 40, right: 20, left: 20),
                            child: CardBalanco('Gasto', 'R\$5000,00','17% - R\$850,00'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Gastos \ndetalhados',
                                  style: txtPoppinsPreto(23),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AdicionarGastos()),
                                    );
                                  },
                                  child: Text(
                                    'Adicionar novo',
                                    style: txtPoppinsSublinhadoAzul(12),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 30, bottom: 20),
                            child: StreamingCard(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 70),
                            child: ListaGastos(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 30),
                            child: SubmitButtonDados(onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AdicionarGastos()),
                              );
                            }),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
