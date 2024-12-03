// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:planix/components/submitButton.dart';
import 'package:planix/components/textForm.dart';
import 'package:planix/components/textStyle.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              heightFactor: 0.40,
              child: Column(
                children: [
                  const SizedBox(height: 80),
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
              heightFactor: 0.60,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Cadastre-se", style: txtPoppinsBold(26)),
                    // Campos de texto
                    TextFF(
                      hint: '', 
                      senha: false, 
                      label: 'Crie um usuário',
                      controller: _usernameController, 
                    ),
                    TextFF(
                      hint: 'nome@gmail.com', 
                      senha: false, 
                      label: 'Insira seu email',
                      controller: _emailController, 
                    ),
                    TextFF(
                      hint: '12345678', 
                      senha: true, 
                      label: 'Insira sua senha',
                      controller: _passwordController, 
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SubmitButton(
                          isLogin: false,
                          usernameController: _usernameController,
                          passwordController: _passwordController,
                          emailController: _emailController, // Passando o controlador de email
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}