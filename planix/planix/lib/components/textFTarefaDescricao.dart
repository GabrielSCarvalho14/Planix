// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:planix/components/textStyle.dart';

class TextFTarefaDescricao extends StatelessWidget {
  const TextFTarefaDescricao({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(left: 34.5, right: 34.5),
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          label: const Text('Escreva uma descrição:'),
          hintStyle: txtPoppinsGrey(14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
      ),
    );
  }
}