// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:planix/components/textStyle.dart';

class BotaoElev extends StatelessWidget {
  final VoidCallback onTap;
  final String texto;
  const BotaoElev({super.key, required this.onTap, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: const Color.fromRGBO(45, 82, 135, 1),
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 356,
            height: 70,
            child: Center(
              child: Text(texto, style: txtPoppinsWhite(16)),
            ),
          ),
        ));
  }
}
