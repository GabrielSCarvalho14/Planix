// ignore_for_file: use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import 'package:planix/components/textStyle.dart';

class SubmitButtonTarefa extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitButtonTarefa({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: const Color.fromRGBO(45, 82, 135, 1),
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            width: 335,
            height: 58,
            child: Center(
              child: Text('Criar tarefa', style: txtPoppinsWhiteBold(20)),
            ),
          ),
        ));
  }
}
