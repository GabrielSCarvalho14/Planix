// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planix/components/botaoElev.dart';
import 'package:planix/components/textStyle.dart';
import 'package:planix/screens/cadastro.dart';
import 'package:planix/screens/login.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 82, 135, 1),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.45,
              child: Column(
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  Text("Planix", style: txtDongle(150)),
                  Text("Planeje suas economias", style: txtPoppinsWhite(16)),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.55,
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Seja Bem-Vindo",
                          style: txtPoppinsBold(26),
                        ),
                        BotaoElev(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                            texto: "Login"),
                        BotaoElev(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Cadastro()));
                            },
                            texto: "Cadastre-se"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(16),
                                  elevation: 5,
                                ),
                                child: Image.asset('assets/google.png',
                                  width: 40,
                                  height: 40,
                                )),
                            const SizedBox(width: 16),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(16),
                                  elevation: 5,
                                ),
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBF73o0P4eNj_YuVFZtaVHAxum9_p4ARUOAg&s',
                                  width: 40,
                                  height: 40,
                                )),
                            const SizedBox(width: 16),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(16),
                                  elevation: 5,
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.apple,
                                  size: 30,
                                  color: Colors.black,
                                )),
                          ],
                        )
                      ])),
            ),
          ),
        ],
      ),
    );
  }
}
