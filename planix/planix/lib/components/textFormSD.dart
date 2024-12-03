// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:planix/components/textStyle.dart';

class TextFFSD extends StatelessWidget {
  final bool senha;
  final String hint;
  final String label;
  final TextEditingController controller; // Adicionei o controlador aqui

  const TextFFSD({
    super.key,
    required this.hint,
    required this.senha,
    required this.label,
    required this.controller, // Adicionei o controlador como parâmetro requerido
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 40.0),
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
        controller: controller, // Associando o controlador ao campo de texto
        obscureText: senha, // Controla se o texto será oculto (para senhas)
        decoration: InputDecoration(
          hintText: hint,
          label: Text(label),
          hintStyle: txtPoppinsGrey(14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
      ),
    );
  }
}