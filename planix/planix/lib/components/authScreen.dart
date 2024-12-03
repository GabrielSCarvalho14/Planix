// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:planix/components/submitButton.dart';
import 'package:planix/components/textForm.dart';

class AuthScreen extends StatefulWidget {
  final bool isLoginScreen;

  const AuthScreen({super.key, required this.isLoginScreen});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Controladores de texto para os campos de email e senha
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isLoginScreen ? 'Login' : 'Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de texto para email (usando TextFF)
            TextFF(
              hint: "nome@gmail.com",
              senha: false,
              label: 'Insira seu email',
              controller: _emailController, // Passando o controlador
            ),
            // Campo de texto para senha (usando TextFF)
            TextFF(
              hint: "12345678",
              senha: true,
              label: 'Insira sua senha',
              controller: _passwordController, // Passando o controlador
            ),
            // Campo de texto para confirmar senha (se for cadastro)
            if (!widget.isLoginScreen)
              TextFF(
                hint: "12345678",
                senha: true,
                label: 'Confirme sua senha',
                controller: _confirmPasswordController, // Passando o controlador
              ),
            const SizedBox(height: 20),
            // Passando os controladores para o SubmitButton
            SubmitButton(
              isLogin: widget.isLoginScreen,
              usernameController: _emailController, // Passando o controlador de email
              passwordController: _passwordController, 
              emailController: _emailController, // Passando o controlador de senha
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Certifique-se de limpar os controladores quando não forem mais usados
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}