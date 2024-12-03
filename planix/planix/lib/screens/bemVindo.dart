// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:planix/components/botaoElev.dart';
import 'package:planix/components/textStyle.dart';
import 'package:planix/screens/dashboard.dart';
import 'package:planix/screens/plannerPessoal.dart';

class BemVindo extends StatelessWidget {
  const BemVindo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff2D5287)
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60,),
            Image.asset("assets/bemVindo.png"),
            const SizedBox(height: 50,),
            Text("Bem Vindo", style: txtPoppinsBold(24),),
            const SizedBox(height: 50,),
            BotaoElev(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PlannerPessoal()));
            }, texto: "Planner Pessoal"),
            const SizedBox(height: 30,),
            BotaoElev(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
            }, texto: "Planner Econômico"),
          ],
        ),
      ),
    );
  }
}