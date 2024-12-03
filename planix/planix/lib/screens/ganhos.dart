import 'package:flutter/material.dart';
import 'package:planix/components/card.dart';
import 'package:planix/components/submitButtonDados.dart';
import 'package:planix/components/textStyle.dart';
import 'package:planix/components/widgetGanhos.dart';
import 'package:planix/screens/adicionarGanhos.dart';
import 'package:planix/screens/detalhesGanhos.dart';

class Ganhos extends StatelessWidget {
  const Ganhos({super.key});

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
                  child: Text('Ganhos', style: txtPoppinsWhite(29)),
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
                              319, 151, 'Você economizou', 'R\$3800,00'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Principal receita', style: txtPoppins(23)),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DetalhesGanhos()),
                                    );
                                  },
                                  child: Text('Ver detalhes',
                                      style: txtPoppinsSublinhadoAzul(12)))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 40, right: 20, left: 20),
                          child: CardBalanco(
                              'Renda', 'R\$5000,00', '76% - R\$3800,00'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rendas que faltam\nentrar',
                                style: txtPoppinsPreto(23),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AdicionarGanhos()),
                                  );
                                },
                                child: Text(
                                  'Adicionar nova',
                                  style: txtPoppinsSublinhadoAzul(12),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, bottom: 70),
                          child: Column(
                            children: [
                              WidgetGanhos(title: 'Salário'),
                              WidgetGanhos(title: '13° Salário'),
                              WidgetGanhos(title: 'Venda perfume'),
                              WidgetGanhos(title: 'Aluguel'),
                              WidgetGanhos(title: 'Venda doces'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 30),
                          child: SubmitButtonDados(onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AdicionarGanhos()),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Botão fixo na parte
          ],
        ),
      ),
    );
  }
}
