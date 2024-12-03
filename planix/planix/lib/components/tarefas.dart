// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:planix/components/textStyle.dart';

class Tarefa extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;

  const Tarefa({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Ícone com borda
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(
              icon,
              color: const Color(0xff5F6368),
              size: 24,
            ),
          ),
          const SizedBox(width: 16.0),
          // Título e horário
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: txtPoppinsPreto(13)
                ),
                const SizedBox(height: 4.0),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Ícone de seta
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 16,
          ),
        ],
      ),
    );
  }
}

class TaskCardExample extends StatelessWidget {
  const TaskCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const Text('Task Card Example'),
        backgroundColor: const Color(0xff2D5186),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TaskCard(
            icon: Icons.check_circle, 
            title: 'Reunião Diária',
            time: '12:00PM - 16:00PM',
          ),
          TaskCard(
            icon: Icons.calendar_today,
            title: 'Planejamento Semanal',
            time: '09:00AM - 11:00AM',
          ),
          TaskCard(
            icon: Icons.campaign,
            title: 'Apresentação do Projeto',
            time: '15:00PM - 17:00PM',
          ),
        ],
      ),
    );
  }
  
  TaskCard({required IconData icon, required String title, required String time}) {}
}

void main() => runApp(const MaterialApp(home: TaskCardExample()));
