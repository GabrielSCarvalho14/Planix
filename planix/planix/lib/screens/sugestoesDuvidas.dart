// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:planix/components/submitButtonSD.dart';
import 'package:planix/components/textFormSD.dart';
import 'package:planix/components/textStyle.dart';

class SugestoesDuvidas extends StatefulWidget {
  const SugestoesDuvidas({super.key});

  @override
  State<SugestoesDuvidas> createState() => _SugestoesDuvidasState();
}

class _SugestoesDuvidasState extends State<SugestoesDuvidas> {
  final TextEditingController _sugestionsController = TextEditingController();
  final TextEditingController _doubtsController = TextEditingController();
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
      backgroundColor: const Color.fromRGBO(45, 82, 135, 1),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.40,
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Image.asset('assets/sugestoesDuvidas.png',
                      width: 251, height: 218)
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.60,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 40.0),
                      child: Text("Sugestões", style: txtPoppins(25)),
                    ),
                    const SizedBox(height: 20,),
                    TextFFSD(
                      hint: 'Muito bom! Recomendo muito',
                      senha: false,
                      label: 'Deixe aqui sua sugestão',
                      controller: _sugestionsController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 15.0, bottom: 15.0),
                      child:
                          Text("Dúvidas", style: txtPoppins(25)),
                    ),
                    TextFFSD(
                      hint: 'Não entendi o funcionamento...',
                      senha: false,
                      label: 'Deixe aqui sua dúvida',
                      controller: _doubtsController,
                    ),
                    const SizedBox(height: 30,),
                    Center(child: SubmitButtonSD(onPressed: () {},))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
