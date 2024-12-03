// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserController with ChangeNotifier {
  // Nome do usuário armazenado após o login
  String? nomeUsuario;

  // Método para acessar a instância única do controlador (Singleton)
  static final UserController _instance = UserController._internal();
  UserController._internal();

  static UserController get instance => _instance;

  // Método para definir o nome do usuário
  void setNomeUsuario(String nome) {
    nomeUsuario = nome;
  }

  // Método para recuperar o nome do usuário
  String getNomeUsuario() {
    return nomeUsuario ??
        ''; // Retorna uma string vazia caso o nome não esteja definido
  }

  // Método para cadastrar o usuário na API
  Future<bool> cadastrar(String username, String email, String password) async {
    final url = Uri.parse(
        'https://13359055-906e-4585-9ab1-eb88fc2281f3-00-fdifq982mbt.worf.replit.dev/cadastro');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "Email": email,
          "Senha": password,
          "NomeUsuario": username,
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        print('Erro no cadastro: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Erro na requisição de cadastro: $e');
      return false;
    }
  }

  // Método para fazer login
  Future<bool> login(String email, String password) async {
    final url = Uri.parse(
        'https://13359055-906e-4585-9ab1-eb88fc2281f3-00-fdifq982mbt.worf.replit.dev/login');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "Email": email,
          "Senha": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Login bem-sucedido: $data');

        // Lida com a ausência de "NomeUsuario" na resposta
        final nomeUsuario = data['NomeUsuario'];
        if (nomeUsuario != null && nomeUsuario is String) {
          setNomeUsuario(nomeUsuario);
        } else {
          print(
              'Atenção: NomeUsuario ausente ou inválido. Usando valor padrão.');
          setNomeUsuario('Usuário'); // Valor padrão para nome
        }

        return true; // Login bem-sucedido
      } else {
        // Lida com erros específicos de status
        final errorData = json.decode(response.body);
        print(
            'Erro no login: ${response.statusCode} - ${errorData['message']}');
        return false;
      }
    } catch (e) {
      print('Erro na requisição de login: $e');
      return false; // Login falhou devido a erro de conexão ou outro problema
    }
  }

  // Método para esquecer a senha
  Future<bool> esqueciSenha(String email) async {
    String nomeUsuario = getNomeUsuario(); // Recuperando o nome do usuário

    final url = Uri.parse(
        'https://13359055-906e-4585-9ab1-eb88fc2281f3-00-fdifq982mbt.worf.replit.dev/$nomeUsuario/esqueci-senha');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "Email": email,
        }),
      );

      if (response.statusCode == 200) {
        print('E-mail de recuperação enviado.');
        return true;
      } else {
        print('Erro ao enviar e-mail de recuperação: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Erro na requisição de recuperação de senha: $e');
      return false;
    }
  }

  // Método para atualizar a senha
  Future<bool> atualizarSenha(String token, String novaSenha, String senha) async {
    String nomeUsuario = getNomeUsuario(); // Recuperando o nome do usuário

    final url = Uri.parse(
        'https://13359055-906e-4585-9ab1-eb88fc2281f3-00-fdifq982mbt.worf.replit.dev/$nomeUsuario/atualizar-senha');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Enviar o token de autenticação
        },
        body: json.encode({
          "NovaSenha": novaSenha,
          "Senha": senha,
        }),
      );

      if (response.statusCode == 200) {
        print('Senha alterada com sucesso.');
        return true;
      } else {
        print('Erro ao mudar a senha: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Erro na requisição de mudança de senha: $e');
      return false;
    }
  }

  // Método para atualizar o email
  Future<bool> atualizarEmail(String token, String email, String nomeUsuario) async {
    String nomeUsuario = getNomeUsuario(); // Recuperando o nome do usuário

    final url = Uri.parse(
        'https://13359055-906e-4585-9ab1-eb88fc2281f3-00-fdifq982mbt.worf.replit.dev/atualizar-email');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Enviar o token de autenticação
        },
        body: json.encode({
          "Email": email,
          "NomeUsuario": nomeUsuario
        }),
      );

      if (response.statusCode == 200) {
        print('Email alterado com sucesso.');
        return true;
      } else {
        print('Erro ao mudar o email: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Erro na requisição de mudança de email: $e');
      return false;
    }
  }
}
