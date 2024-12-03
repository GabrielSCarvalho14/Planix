import 'package:flutter/material.dart';
import 'package:planix/components/customOptionButton.dart';
import 'package:planix/components/textStyle.dart';
import 'package:planix/controllers/userController.dart';
import 'package:planix/screens/mudarEmail.dart';
import 'package:planix/screens/mudarSenha.dart';
import 'package:planix/screens/sugestoesDuvidas.dart';
import 'package:planix/screens/telaInicial.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final String nomeUsuario = userController.getNomeUsuario();

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
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.35,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xff2D5186),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Perfil', style: txtPoppinsWhite(25)),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 144,
                                height: 144,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/perfil.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.add_circle,
                                    size: 27,
                                    color: Color(0xff2D5186),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            nomeUsuario.isNotEmpty ? nomeUsuario : 'Usuário', 
                            style: txtPoppinsWhite(30),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.65,
              child: Column(
                children: [
                  const SizedBox(height: 60,),
                  CustomOptionButton(icon: Icons.lock_outline, text: 'Mudar senha', onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => const MudarSenha()),);} ),
                  CustomOptionButton(icon: Icons.email_outlined, text: 'Endereço de Email', onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => const MudarEmail()),);} ),
                  CustomOptionButton(icon: Icons.sentiment_very_satisfied, text: 'Sugestões e Duvidas', onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => const SugestoesDuvidas()),);} ),
                  CustomOptionButton(icon: Icons.exit_to_app, text: 'Sair', onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => const TelaInicial()),);} ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
