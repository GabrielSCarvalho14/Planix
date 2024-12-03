import 'package:flutter/material.dart';
import 'package:planix/components/card.dart';
import 'package:planix/components/switchButton.dart';
import 'package:planix/components/textStyle.dart';
import 'package:planix/screens/ganhos.dart';
import 'package:planix/screens/gastos.dart';
import 'package:planix/screens/perfil.dart';
import 'package:planix/screens/vencimentos.dart';

class Dashboard extends StatelessWidget {
  final bool isSwitched = true;
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xff2D5287)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/contaCirculada.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Perfil()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Text(
              "Olá, Débora",
              style: txtDonglePreto(45),
            ),
            Text(
              "Bom dia",
              style: txtDongleAzul(30),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 348,
              height: 140,
              child: Card(
                color: const Color(0xffffffff),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                      color: Color(0xff2d5287),
                      width: 2,
                    )),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bem-Vindo',
                            style: txtDongleBold(35),
                          ),
                          const SizedBox(height: 8),
                          Text('Comece a cuidar melhor\nde suas finanças',
                              style: txtPoppinsPreto(13)),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Image.asset(
                        'assets/dashboard.png',
                        width: 100,
                        height: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text('Meu Saldo', style: txtPoppinsBold(16)),
            const SizedBox(
              height: 15,
            ),
            const CardAzul(),
            const SizedBox(height: 15),
            Text(
              'Seu Planner econômico',
              style: txtPoppinsSemiBold(16),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const Perfil()),
                      //   );
                      // },
                      child: CardCinza(
                          'assets/uis_chart.png', 'Balanço\neconômico')),
                  GestureDetector(
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Vencimentos()),
                        );
                      },
                    child: CardCinza(
                        'assets/solar_danger-bold.png', 'Vencimentos\ngerais'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Ganhos()),
                        );
                      },
                      child: CardCinza(
                          'assets/credit_card_heart.png', 'Ganhos e\nlucros')),
                  GestureDetector(
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Gastos()),
                        );
                      },
                    child: CardCinza('assets/fluent_money-off-24-filled.png',
                        'Gastos e\ndespesas'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 60),
            SwitchButton(isSwitched: false)
          ],
        ),
      ),
    );
  }
}
