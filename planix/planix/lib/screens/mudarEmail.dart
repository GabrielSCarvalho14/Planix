// ignore_for_file: library_private_types_in_public_api, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:planix/components/submitButtonEmail.dart';
import 'package:planix/components/textForm.dart';
import 'package:planix/components/textStyle.dart';
import 'package:planix/controllers/userController.dart';

class MudarEmail extends StatefulWidget {
  const MudarEmail({super.key});

  @override
  _MudarEmailState createState() => _MudarEmailState();
}

class _MudarEmailState extends State<MudarEmail> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final UserController _userController = UserController.instance; // Controlador de usuário

  Future<void> _handleChangeEmail() async {
    // Validação básica dos campos de email
    if (_emailController.text.isEmpty || _newEmailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos.')),
      );
      return;
    }

    if (_emailController.text == _newEmailController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('O novo email não pode ser o mesmo que o atual.')),
      );
      return;
    }

    // Chame o método para atualizar o email na API
    bool success = await _userController.atualizarEmail(
      'token_aqui', // Substitua pelo token de autenticação real
      _newEmailController.text,
      _usernameController.text,
    );

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email alterado com sucesso.')),
      );
      Navigator.pop(context); // Retorna para a tela anterior após o sucesso
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao alterar email.')),
      );
    }
  }

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
                  Image.asset('assets/mudarEmail.png', width: 252, height: 214)
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
                      child: Text("Endereço de Email", style: txtPoppins(25)),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        TextFF(
                          hint: '', 
                          senha: false, 
                          label: 'Nome de usuário:',
                          controller: _usernameController, 
                        ),
                        const SizedBox(height: 20),
                        TextFF(
                          hint: '', 
                          senha: false, 
                          label: 'Novo Email',
                          controller: _newEmailController, 
                        ),
                      ],
                    ),
                    const SizedBox(height: 130),
                    Center(
                      child: SubmitButtonEmail(
                        onPressed: _handleChangeEmail, // Adiciona a lógica aqui
                      ),
                    ),
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
    _newEmailController.dispose();
    super.dispose();
  }
}
