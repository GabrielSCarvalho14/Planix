// ignore_for_file: library_private_types_in_public_api, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:planix/components/submitButtonSenha.dart';
import 'package:planix/components/textForm.dart';
import 'package:planix/components/textStyle.dart';
import 'package:planix/controllers/userController.dart';
import 'package:planix/screens/esqueceuSenha.dart';

class MudarSenha extends StatefulWidget {
  const MudarSenha({super.key});

  @override
  _MudarSenhaState createState() => _MudarSenhaState();
}

class _MudarSenhaState extends State<MudarSenha> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final UserController _userController = UserController.instance; // Controlador de usuário
  
  Future<void> _handleChangePassword() async {
    // Validação básica dos campos de senha
    if (_newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('As senhas não coincidem.')),
      );
      return;
    }
    
    // Chamando o método de atualização de senha com o token e a nova senha
    bool success = await _userController.atualizarSenha(
      'token_aqui', // Substitua por um token de autenticação válido
      _newPasswordController.text,
      _passwordController.text,
    );

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Senha alterada com sucesso.')),
      );
      Navigator.pop(context); // Retorna para a tela anterior após o sucesso
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
                      child: Text("Mudar senha", style: txtPoppins(25)),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        TextFF(
                          hint: '',
                          senha: true,
                          label: 'Senha atual',
                          controller: _passwordController,
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
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EsqueceuSenha(),
                              ),
                            );
                          },
                          child: Text(
                            "Esqueceu a senha?",
                            style: txtPoppinsSublinhadoAzul(12),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: SubmitButtonSenha(
                            onPressed: _handleChangePassword,
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

  @override
  void dispose() {
    _passwordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
