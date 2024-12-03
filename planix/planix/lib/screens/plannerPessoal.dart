// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:planix/components/switchButton.dart';
import 'package:planix/components/textStyle.dart';
import 'package:planix/controllers/userController.dart';
import 'package:planix/screens/calendario.dart';
import 'package:planix/screens/listaMetas.dart';
import 'package:planix/screens/perfil.dart';

class PlannerPessoal extends StatelessWidget {
  final bool isSwitched = false;
  const PlannerPessoal({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final String nomeUsuario = userController.getNomeUsuario();
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Olá, ${nomeUsuario.isNotEmpty ? nomeUsuario : 'Usuário'}",
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
              height: 120,
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
                            style: txtDongleBold(32),
                          ),
                          const SizedBox(height: 8),
                          Text('Planeje melhor seu dia a dia \ne tempo',
                              style: txtPoppinsPreto(9)),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Image.asset(
                        'assets/plannerPessoal.png',
                        width: 100,
                        height: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text("Organize seu Planner", style: txtPoppinsBold(16)),
            const SizedBox(height: 20),
            Container(
              width: 348,
              height: 148,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.2),
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff0f0f0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Calendario()),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/calendario.png',
                      width: 69,
                      height: 69,
                    ),
                    const SizedBox(height: 8),
                    Text('Calendário', style: txtPoppins(15)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 348,
              height: 148,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff0f0f0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListaMetas()),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/metas.png',
                      width: 69,
                      height: 69,
                    ),
                    const SizedBox(height: 8),
                    Text('Metas', style: txtPoppins(15)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            SwitchButton(isSwitched: true),
          ],
        ),
      ),
    );
  }
}
