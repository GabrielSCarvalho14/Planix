// ignore_for_file: use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import 'package:planix/controllers/userController.dart';
import 'package:planix/screens/bemVindo.dart';
import 'package:planix/screens/login.dart';
import 'package:provider/provider.dart';

class SubmitButton extends StatelessWidget {
  final bool isLogin;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;

  const SubmitButton({
    super.key,
    required this.isLogin,
    required this.usernameController,
    required this.passwordController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 34.5, bottom: 8.0),
      child: Consumer<UserController>(
        builder: (context, userController, child) {
          return ElevatedButton(
            onPressed: () async {
              if (isLogin) {
                bool success = await userController.login(
                    emailController.text, passwordController.text);
                if (success) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BemVindo(),
                      ));
                } else {
                  _showErrorDialog(
                      context, 'Login falhou. Verifique suas credenciais.');
                }
              } else {
                bool success = await userController.cadastrar(
                  usernameController.text,
                  emailController.text,
                  passwordController.text,
                );
                if (success) {
                  _showSuccessDialog(
                      context, 'Cadastro concluído com sucesso!');

                  await Future.delayed(const Duration(seconds: 2));

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ));
                } else {
                  _showErrorDialog(
                      context, 'Cadastro falhou. Tente novamente.');
                }
              }
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: const Color(0xff2d5287),
              padding: const EdgeInsets.all(20),
              elevation: 10,
              shadowColor: Colors.black,
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 30,
            ),
          );
        },
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sucesso'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}