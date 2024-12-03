import 'package:flutter/material.dart';
import 'package:planix/components/card.dart';
import 'package:planix/components/textStyle.dart';

class Vencimentos extends StatelessWidget {
  const Vencimentos({super.key});

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
                  child: Text('Vencimentos', style: txtPoppinsWhite(29)),
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
                          padding: const EdgeInsets.all(30.0),
                          child: Text('Próximo vencimento', style: txtPoppinsBold(21)),
                        ),
                        CardAzulNormal(341, 113, "Vencimento mais próximo", "26 de Agosto"),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text('Regularização das contas', style: txtPoppins(21)),
                        ),
                        const SizedBox(height: 20),
                        CardBranco(),
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, bottom: 20.0),
                          child: Text('Datas de vencimento:', style: txtPoppins(21)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CardAzulTroca(true, 'Água', 'Dia: 27', 380, 58),
                            const SizedBox(height: 20),
                            CardAzulTroca(false, 'Luz', 'Dia: 20',380, 58),
                            const SizedBox(height: 20),
                            CardAzulTroca(true, 'Gás', 'Dia: 18', 380, 58),
                            const SizedBox(height: 20),
                            CardAzulTroca(true, 'Internet', 'Dia: 15', 380, 58),
                            const SizedBox(height: 20),
                            CardAzulTroca(false, 'Streaming', 'Dia: 03', 380, 58),
                            const SizedBox(height: 60),
                          ])
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