// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:planix/components/submitButtonTarefa.dart';
import 'package:planix/components/tarefas.dart';
import 'package:planix/components/textStyle.dart';
import 'package:planix/screens/criarTarefa.dart';

class ListaTarefas extends StatelessWidget {
  const ListaTarefas({super.key});

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
                  child: Text('Tarefas', style: txtPoppinsWhite(29)),
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Tarefa(
                            title: 'Tarefa ${index + 1}',
                            time: '${index + 6}:00 - ${index + 7}:00', 
                            icon: Icons.check_circle_outline_sharp,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Botão fixo na parte inferior
            Positioned(
                bottom: 35,
                left: 16,
                right: 16,
                child: SubmitButtonTarefa(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CriarTarefa()),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
