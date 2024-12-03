// ignore_for_file: use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import 'package:planix/components/submitButtonSenha.dart';
import 'package:planix/components/textForm.dart';
import 'package:planix/components/textStyle.dart';
import 'package:planix/controllers/userController.dart'; // Importe o controlador de usuário

class EsqueceuSenha extends StatefulWidget {
  const EsqueceuSenha({super.key});

  @override
  State<EsqueceuSenha> createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  final UserController _userController = UserController.instance;

  Future<void> _handleChangePassword() async {
  // Verificar se as senhas coincidem
  if (_newPasswordController.text != _confirmPasswordController.text) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('As senhas não coincidem.')),
    );
    return;
  }

  // Token de exemplo, em uma aplicação real, recupere-o de uma fonte confiável
  String token = 'seu_token_de_autenticacao_aqui';

  // Chama o método para atualizar a senha com o token e nova senha
  bool success = await _userController.atualizarSenha(
    token,
    _newPasswordController.text,
    _passwordController.text,
  );

  if (success) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Senha alterada com sucesso.')),
    );
    Navigator.pop(context); // Voltar para a tela anterior
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Erro ao alterar senha.')),
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
                  Image.asset('assets/esqueceuSenha.png', width: 300, height: 201)
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
                      child: Text("Esqueceu a senha", style: txtPoppins(25)),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        TextFF(
                          hint: '', 
                          senha: false, 
                          label: 'Digite seu email cadastrado',
                          controller: _emailController, 
                        ),
                        const SizedBox(height: 15),
                        TextFF(
                          hint: '', 
                          senha: true, 
                          label: 'Nova senha',
                          controller: _newPasswordController, 
                        ),
                        const SizedBox(height: 15),
                        TextFF(
                          hint: '', 
                          senha: true, 
                          label: 'Confirmar nova senha',
                          controller: _confirmPasswordController,
                        ),
                        const SizedBox(height: 45),
                        Center(
                          child: SubmitButtonSenha(
                            onPressed: _handleChangePassword, // Adicione o callback aqui
                          ),
                        ),
                      ],
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
}
